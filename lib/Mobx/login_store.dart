import 'package:mobx/mobx.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:testetela/helper.dart' as globals;
import 'package:testetela/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:testetela/views/admhome.dart';
import 'package:testetela/helper.dart' as globals;

part 'login_store.g.dart';

const url = "http://192.168.0.100:3333";

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{

  @observable
  bool loading = false;

  @observable
  Usuario us;

  @observable
  String login = "";

  @action
  void setLogin(String value) => login = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void senhaVisivel() => passwordVisible = !passwordVisible;

  @computed
  bool get isPasswordValid => password.length >= 1;

  @computed
  bool get isLoginValid => login.length >= 5;

  @computed
  bool get isFormValid => login.length > 5 && password.length > 1;

  @computed
  Function get loginPressed => ( isLoginValid && isPasswordValid && !loading ) ? logar : null;

  @action
  logar() async{
    loading = true;

    var corpo = json.encode({ "login": login, "senha": password});

    print("Body: $corpo");

    http.Response response = await http.post(url + "/logar",
        headers: { "Content-Type": "application/json" },
        body: corpo
    );

    var resposta = jsonDecode(response.body);

    if(response.statusCode == 400)
    {
      print(resposta["error"]);
      loading = false;
    }
    else {

      print("$resposta");

      //int id = resposta["id"];

      globals.id = resposta["id"];

      //String nome = resposta["nome"];

      globals.nome = resposta["nome"];

      //String email = resposta["email"];

      globals.email = resposta["email"];

      //String crm = resposta["crm"];

      globals.crm = resposta["crm"];

      //String cre = resposta["cre"];

      globals.cre = resposta["cre"];

      //int nivel = resposta["nivel"];

      globals.nivel = resposta["nivel"];

      //bool status = resposta["status"];

      globals.status = resposta["status"];

     /* Usuario u = new Usuario(id: id,
          nome: nome,
          email: email,
          crm: crm,
          cre: cre,
          nivel: nivel,
          status: status);
      */

      loading = false;


    }
  }

}