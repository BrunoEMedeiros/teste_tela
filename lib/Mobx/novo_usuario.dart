import 'package:mobx/mobx.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

part 'novo_usuario.g.dart';
const url = "http://192.168.0.103:3333";


class NovoUsuario = _NovoUsuario with _$NovoUsuario;

abstract class _NovoUsuario with Store{

  @observable
  bool crm_check = false;

  @observable
  bool cre_check = false;

  @action
  void setCRMcheck(bool value)
  {
    cre_check = false;
    cre = "";
    crm_check = value;

  }

  @action
  void setCREcheck(bool value)
  {
    crm_check = false;
    crm = "";
    cre_check = value;
  }

  @observable
  int completestep = 0;


  @observable
  int step = 0;

  @action
  void setStep()
  {
    step <= 3 ? step++ : step = 3;

    if(completestep >= 0)
      {
        completestep = completestep + 1;
        print(completestep);
      }
  }

  @action
  void desStep()
  {
    if(step == 1){

      nome = "";
      email = "";
      crm = "";
      cre = "";
      completestep = 0;
    }

    step >= 1 ? step-- : step = 1;

    completestep = completestep--;

    print(completestep);

  }

  @observable
  String nome = "";

  @action
  void setNome(String value) => nome = value;

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String crm = "";

  @action
  void setCRM(String value) => crm = value;

  @observable
  String cre = "";

  @action
  void setCRE(String value) => cre = value;

  @computed
  bool get isFormValid => nome.length >= 5
      && email.length >= 5;

  @computed
  Function get novousuarioPressed => ( isFormValid ) ? novo : null;

  @action
  novo() async{

    if(crm_check == true){
      var corpo = json.encode({ "nome": nome, "email": email, "crm": crm, "cre": null, "nivel": 1, "status": false});
      print("Body: $corpo");

      http.Response response = await http.post(url + "/users",
          headers: { "Content-Type": "application/json" },
          body: corpo
      );

      var resposta = jsonDecode(response.body);

      if(response.statusCode == 400)
      {
        print(resposta["error"]);
      }

      setStep();
    }
    if(cre_check == true)
      {
        var corpo = json.encode({ "nome": nome, "email": email, "crm": null, "cre": cre, "nivel": 1, "status": false});
        print("Body: $corpo");

        http.Response response = await http.post(url + "/users",
            headers: { "Content-Type": "application/json" },
            body: corpo
        );

        var resposta = jsonDecode(response.body);

        if(response.statusCode == 400)
        {
          print(resposta["error"]);
        }

        setStep();
      }
    
  }

  @action
  excluir() async{

  }


}