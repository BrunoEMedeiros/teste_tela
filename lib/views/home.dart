import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:testetela/views/admhome.dart';
import 'package:testetela/Mobx/login_store.dart';
import 'package:testetela/widgets/custom_text_field.dart';
import 'package:testetela/widgets/custom_icon_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:testetela/helper.dart' as globals;
import 'package:testetela/models/usuario.dart';
const url = "http://192.168.0.100:3333";


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //inicializando o observable
  LoginStore loginStore = LoginStore();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    disposer = reaction((_) => loginStore.loading, (loading){
      if(!loading){
        Usuario u = new Usuario(nome: globals.nome, email: globals.email, crm: globals.crm, cre: globals.cre, nivel: globals.nivel);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => AdmHome(u)));
      }
    });
  }
  /*

  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();


  _logar() async{

    String login = _controllerLogin.text;
    String senha = _controllerSenha.text;

    var corpo = json.encode({ "login": login, "senha": senha});

    //print("Body: $corpo");

    http.Response response = await http.post(url + "/logar",
        headers: { "Content-Type": "application/json" },
        body: corpo
    );

    var resposta = jsonDecode(response.body);

    if(response.statusCode == 400)
    {
      print(resposta["error"]);
    }
    else {

      //print("$resposta");

      int id = resposta["id"];

      //globals.ID = resposta["id"];

      String nome = resposta["nome"];

      String email = resposta["email"];

      String crm = resposta["crm"];

      String cre = resposta["cre"];

      int nivel = resposta["nivel"];

      bool status = resposta["status"];

      Usuario u = new Usuario(id: id,
          nome: nome,
          email: email,
          crm: crm,
          cre: cre,
          nivel: nivel,
          status: status);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => AdmHome(u)));
      if(nivel == 1){

      }
      else{
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => UsuarioHome(u)));
      }

    }
  }
   */

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 0.3
        ),
        backgroundColor: Colors.white,
        title: Text("Youtube"),
        actions: <Widget>[ //definir objetos de ação
          IconButton(
            icon: Icon(Icons.camera_alt,
            size: 30,
            ),
            onPressed: (){
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 16,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Observer(
                    builder: (_){
                      return CustomTextField(
                        hint: 'Login',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.text,
                        onChanged: loginStore.setLogin,
                        enabled: !loginStore.loading,
                        //controller: _controllerLogin,
                      );
                    },
                  ),
                  const SizedBox(height: 16,),
                  Observer(
                    builder: (_){
                      return CustomTextField(
                        hint: 'Senha',
                        prefix: Icon(Icons.lock),
                        obscure: !loginStore.passwordVisible,
                        onChanged: loginStore.setPassword,
                        enabled: !loginStore.loading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: loginStore.passwordVisible ? Icons.visibility_off : Icons.visibility,
                          onTap: loginStore.senhaVisivel,
                        ),
                        //controller: _controllerSenha,
                      );
                    },
                  ),
                  const SizedBox(height: 16,),
                  Observer(
                      builder: (_){
                        return SizedBox(
                          height: 44,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: loginStore.loading ?
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ) :
                            Text('Login'),
                            color: Theme.of(context).primaryColor,
                            disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            onPressed: loginStore.loginPressed,
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
      ),
    ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }


}
