import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testetela/models/usuario.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:testetela/views/home.dart';
import 'package:testetela/views/novousuario.dart';

class AdmHome extends StatefulWidget {
  Usuario usuario;

  AdmHome(this.usuario);

  @override
  _AdmHomeState createState() => _AdmHomeState();
}

class _AdmHomeState extends State<AdmHome> {

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
      print("usuario " + user["nome"]);
      Usuario u = Usuario(id: user["id"], nome: user["nome"], email: user["email"], crm: user["crm"], cre: user["cre"], nivel: user["nivel_id"], status: user["status"]);
      usuarios.add(u);
    }

    return usuarios;
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.grey,
              opacity: 0.3
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
          bottom: TabBar(
            tabs: <Widget>[
              Text("Usuarios",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18
              ),
              ),
              Text("Relatórios",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                ),
              ),
              Text("Teste",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
             Column(
               children: <Widget>[
                  Row(
                    children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                            ),
                            color: Colors.greenAccent,
                            child: Text("Novo",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) => NovoUsuario()));

                            },
                          ),
                        ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),
                          color: Colors.lightBlue,
                          child: Text("Alterar",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          onPressed: (){},
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),
                          color: Colors.redAccent,
                          child: Text("Inativar",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          onPressed: (){},
                        ),
                      ),
                      ]
                  ),
                 Expanded(
                   flex: 1,
                   child: Container(
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
                                             color: snapshot.data[index].nivel == 1 ? Colors.blue[100]: Colors.white,
                                             borderRadius: BorderRadius.all(Radius.circular(16)),
                                           ),
                                           child: CardNvo(nome: snapshot.data[index].nome, email: snapshot.data[index].email, crm: snapshot.data[index].crm, cre: snapshot.data[index].cre,)
                                         );
                                       },
                                   );
                               }

                               break;
                           }
                         }
                     ),
                   )
                 ),
               ],
             ),
            Text("Ola",
            style: TextStyle(
              color: Colors.black
            ),
            ),
            Text("Ola 2",
              style: TextStyle(
                  color: Colors.black
              ),
            )
          ],
        )
      ),
    );
  }

  Widget CardNvo({var nome, var email, var crm, var cre})
  {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
              child: Text(crm,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.info),
              iconSize: 16,
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context){
                    return Container(
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        title: Icon(
                            Icons.info
                        ),
                        content: Msginfo(nome: nome, email: email, crm: crm, cre: cre),
                        actions: <Widget>[
                          Center(
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Center(
                                  child:Text("OK")
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget Msginfo({var nome, var email, var crm, var cre})
  {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Nome: " + nome),

          Text("Email: " + email),

         Text("CRM: " + crm),

          Text("CRE: " + cre),

        ],
      ),
    );
  }

  /*ListTile(
                                             title: Text( snapshot.data[index].nome,
                                               style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 20
                                               ),
                                             ),
                                             subtitle: Text( "ID:"+snapshot.data[index].email,
                                               style: TextStyle(
                                                 color: Colors.black,
                                                 fontSize: 20,
                                               ),
                                             ),

                                           ),*/
}
