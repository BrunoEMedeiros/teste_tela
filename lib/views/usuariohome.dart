import 'package:flutter/material.dart';
import 'package:testetela/models/usuario.dart';

class UsuarioHome extends StatefulWidget {
  Usuario usuario;

  UsuarioHome(this.usuario);

  @override
  _UsuarioHomeState createState() => _UsuarioHomeState();
}

class _UsuarioHomeState extends State<UsuarioHome> {
  var nome;


  @override
  void initState() {
    super.initState();
    nome =  widget.usuario.nome;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                ),
                Text("Usuario",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                ),
                RaisedButton(
                  child: Text("Usuarios",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  color: Colors.green,
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  onPressed: (){},
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
