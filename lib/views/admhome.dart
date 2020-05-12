import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testetela/models/usuario.dart';
import 'package:testetela/Mobx/user_list.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:testetela/views/home.dart';
import 'package:testetela/views/newusuario.dart';
//import 'package:testetela/views/newusuario.dart';
import 'package:testetela/widgets/custom_text_field.dart';
import 'package:testetela/widgets/CardNovo.dart';

const url = "http://192.168.0.103:3333";


class AdmHome extends StatefulWidget {
  Usuario usuario;

  AdmHome(this.usuario);

  @override
  _AdmHomeState createState() => _AdmHomeState();
}

class _AdmHomeState extends State<AdmHome> {

  UserList userlist = new UserList();

  var nome;


  @override
  void initState() {
    super.initState();
    nome =  widget.usuario.nome;
  }
  
  Future<List<Usuario>> _listarUsuarios() async {
    
    http.Response response = await http.get(url + "/index");
    var dadosJson = json.decode(response.body);
    List<Usuario> usuarios = List();
    for(var user in dadosJson)
    {
      //print("usuario " + user["nome"]);
      Usuario u = Usuario(id: user["id"], nome: user["nome"], email: user["email"], crm: user["crm"], cre: user["cre"], nivel: user["nivel_id"], status: user["status"]);
      usuarios.add(u);
    }

    return usuarios;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.grey,
              opacity: 0.6
          ),
          backgroundColor: Colors.white,
          title: Text("$nome",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black
            ),
          ),
          actions: <Widget>[ //definir objetos de ação
            IconButton(
              icon: Icon(Icons.menu,
                size: 30,
              ),
              onPressed: (){
              },
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1,1],
              colors: [
                Colors.blue[700],
                Colors.lightBlue[100],
              ],
            )
          ),
          child:
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 10),
                          child: CustomTextField(
                            hint: 'Pesquisar',
                            suffix: Icon(Icons.search),
                            textInputType: TextInputType.text,
                            onChanged: (_){
                            },
                            //enabled: !loginStore.loading,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // button color
                            child: InkWell(
                              splashColor: Colors.green, // inkwell color
                              child: SizedBox(width: 56, height: 56, child: Icon(Icons.add, color: Colors.blue,)),
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (_) => NewUsuario()));
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          child: FutureBuilder<List<Usuario>>(
                              future: _listarUsuarios(),
                              // ignore: missing_return
                              builder: (context, snapshot){
                                switch(snapshot.connectionState){
                                  case ConnectionState.none:
                                  case ConnectionState.waiting:
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                    break;
                                  case ConnectionState.active:
                                  case ConnectionState.done:
                                    if(snapshot.hasError){
                                      print("erro ao carregar lista");
                                    }
                                    else{
                                      return ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index)
                                        {
                                          return Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(16)),
                                            ),
                                            child: CardNovoWidget(nome: snapshot.data[index].nome, email: snapshot.data[index].email, crm: snapshot.data[index].crm, cre: snapshot.data[index].cre,),
                                          );
                                        },
                                      );
                                    }
                                    break;
                                }
                              }
                          ),
                    ),
                  ),
                ],
              ),
        ),
      );
  }
}
