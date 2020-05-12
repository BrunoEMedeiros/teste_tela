import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testetela/Mobx/novo_usuario.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testetela/widgets/custom_text_field.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const url = "http://192.168.0.103:3333";



class NewUsuario extends StatefulWidget {

  @override
  _NewUsuarioState createState() => _NewUsuarioState();

}

class _NewUsuarioState extends State<NewUsuario> {


  static NovoUsuario novoUsuario = NovoUsuario();

  static TextEditingController _controllerNome = TextEditingController();
  static TextEditingController _controllerEmail = TextEditingController();
  static TextEditingController _controllerCRM = TextEditingController();
  static TextEditingController _controllerCRE = TextEditingController();

  novo() async{

    String Nome = _controllerNome.text;
    String Email = _controllerEmail.text;
    String CRM = _controllerCRM.text;
    String CRE = _controllerCRE.text;

    var corpo = json.encode({ "nome": Nome, "email": Email, "crm": CRM, "cre": CRE, "nivel_id": 1, "status": false});

    //print("Body: $corpo");

    http.Response response = await http.post(url + "/users",
        headers: { "Content-Type": "application/json" },
        body: corpo
    );

    var resposta = jsonDecode(response.body);

    if(response.statusCode == 400)
    {
      AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          title: Icon(
              Icons.info
          ),
          content: Text("Usuario ja cadastrado, revise as informações"),
          actions: <Widget>[
              RaisedButton(
                child: Text("OK"),
                color: Colors.green,
                textColor: Colors.white,
                onPressed:(){
                  Navigator.pop(context);
                },
              ),
            ]
      );
    }

    return resposta.nome;

  }

  List<Step> steps = [
    Step(
      title: const Text('Usuario'),
      isActive: novoUsuario.completestep == 1 ? true : false,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          Observer(
            builder: (_){
              return CustomTextField(
                hint: 'Nome',
                textInputType: TextInputType.text,
                onChanged: novoUsuario.setNome,
                controller: _controllerNome,
              );
            },
          ),
          const SizedBox(height: 16,),
          Observer(
            builder: (_){
              return CustomTextField(
                hint: 'Email',
                textInputType: TextInputType.text,
                onChanged: novoUsuario.setEmail,
                controller: _controllerEmail,
              );
            },
          ),
          const SizedBox(height: 16,),
          Row(
            children: <Widget>[
              Observer(
                builder: (_){
                  return Checkbox(
                    value: novoUsuario.crm_check,
                    onChanged: (bool value){
                      novoUsuario.setCRMcheck(value);
                    },
                  );
                },
              ),
              Observer(
                builder: (_){
                    return  SizedBox(
                      width: 100,
                      child:  CustomTextField(
                        controller: _controllerCRM,
                        hint: 'CRM',
                        enabled: novoUsuario.crm_check,
                        textInputType: TextInputType.text,
                        onChanged: novoUsuario.setCRM,
                        //controller: _controllerLogin,
                      ),
                    );
                },
              ),
              const SizedBox(height: 16,),
              Observer(
                builder: (_){
                  return Checkbox(
                    value: novoUsuario.cre_check,
                      onChanged: (bool value){
                          novoUsuario.setCREcheck(value);
                      },
                  );
                },
              ),
              Observer(
                builder: (_){
                  return  SizedBox(
                    width: 100,
                    child:  CustomTextField(
                      enabled: novoUsuario.cre_check,
                      hint: 'CRE',
                      textInputType: TextInputType.text,
                      onChanged: novoUsuario.setCRE,
                      controller: _controllerCRE,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16,),
            ],
          ),

        ],
      ),
    ),
    Step(
      title: const Text('Email'),
      isActive: novoUsuario.completestep == 2 ? true : false,
      state: StepState.editing,
      content: Center(
          child: Text("2", style: TextStyle(color: Colors.black),)
      ),
    ),
    Step(
      title: const Text('Confirmação'),
      isActive: novoUsuario.completestep == 3 ? true : false,
      state: StepState.complete,
      content: Center(
          child: Text("3", style: TextStyle(color: Colors.black))
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text("Cadastro de usuario",
        style: TextStyle(
            fontSize: 20,
            color: Colors.black
        ),
      ),
    ),
      body: Column(children: <Widget>[
      Expanded(
          child: Observer(
            builder: (_){
              return Stepper(
                type: StepperType.horizontal,
                steps: steps,
                currentStep: novoUsuario.step,
                onStepContinue: novoUsuario.setStep,
                onStepCancel: novoUsuario.desStep,
                controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}){
                  return Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Observer(
                          builder: (_){
                            return RaisedButton(
                              child: Text("Proximo",
                              style: TextStyle(
                                color: Colors.white,
                              ),),
                              onPressed: novoUsuario.novousuarioPressed,
                              color: Colors.green,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Observer(
                          builder: (_){
                            return RaisedButton(
                              child: Text("Voltar",
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                              onPressed: novoUsuario.step > 0 ?

                                onStepCancel

                                  : null,
                              color: Colors.blue,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ),
      ],
      ),
    );
  }
}
