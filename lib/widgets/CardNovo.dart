import 'package:flutter/material.dart';
//import 'package:testetela/widgets/msgUsuario.dart';
import 'package:testetela/widgets/custom_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testetela/Mobx/user_list.dart';


class CardNovoWidget extends StatelessWidget {

  CardNovoWidget({this.nome, this.email, this.crm, this.cre});

  final String nome;
  final String email;
  final String crm;
  final String cre;

  UserList userList = new UserList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            width: 40,
            height: 40,
            child: Image.asset(crm == null ? "imagens/enfermagem.png": "imagens/medico.jpg"),
          ),
          Expanded(
            flex: 2,
            child: Text(nome,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(crm == null ? cre : crm,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.info),
              iconSize: 16,
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context){
                    return SafeArea(
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        title: Icon(
                            Icons.info
                        ),
                        content: alertUsuario(nome: nome, email: email, crm: crm, cre: cre),
                        actions: <Widget>[
                          Observer(
                            builder: (_){
                              return Center(
                                child: RaisedButton(
                                  child: userList.enableEditing ?
                                  Text("Salvar") :
                                  Text("Ok"),
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  onPressed:(){
                                    userList.enableEditing = false;
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          ),
                           Observer(
                             builder: (_){
                               return Center(
                                 child: RaisedButton(
                                   color: Colors.lightBlueAccent,
                                   child: Center(
                                       child:Text("Alterar")
                                   ),
                                   onPressed: userList.enableEditing == false ? userList.setEnableEditing: null,
                                 ),
                               );
                             },
                           ),
                          Observer(
                            builder: (_){
                              return Center(
                                child: RaisedButton(
                                  child: userList.enableEditing ?
                                  Text("Cacelar") :
                                  Text("Inativar"),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  onPressed: (){},
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }

  Widget alertUsuario({var nome, var email, var crm, var cre})
  {
    return Container(
      child: ListView(
        shrinkWrap: true, //just set this property
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Observer(
            builder: (_){
              return CustomTextField(
                hint: nome,
                //suffix: Icon(Icons.search),
                //textInputType: TextInputType.text,
                enabled: userList.enableEditing,
              );
            },
          ),
          const SizedBox(height: 16,),
          Observer(
            builder: (_){
              return CustomTextField(
                hint: email,
                //suffix: Icon(Icons.search),
                //textInputType: TextInputType.text,
                enabled: userList.enableEditing,
              );
            },
          ),
          const SizedBox(height: 16,),
          Observer(
            builder: (_){
              return CustomTextField(
                hint: crm,
                //suffix: Icon(Icons.search),
                //textInputType: TextInputType.text,
                enabled: userList.enableEditing,
              );
            },
          ),
          const SizedBox(height: 16,),
          Observer(
            builder: (_){
              return CustomTextField(
                hint: cre,
                //suffix: Icon(Icons.search),
                //textInputType: TextInputType.text,
                enabled: userList.enableEditing,
              );
            },
          ),
        ],
      ),
    );
  }
}