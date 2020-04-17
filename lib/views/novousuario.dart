import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testetela/models/usuario.dart';
import 'package:testetela/models/nivel.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:testetela/views/home.dart';

class NovoUsuario extends StatefulWidget {
  @override
  _NovoUsuarioState createState() => _NovoUsuarioState();


}

class _NovoUsuarioState extends State<NovoUsuario> {


  bool crm_check = false;
  bool cre_check = false;

  void crmChanged(bool value){
      setState(() {
        crm_check = value;
        cre_check = false;
      });
  }

  void creChanged(bool value){
    setState(() {
      cre_check = value;
      crm_check = false;
    });
  }

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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          //margin: EdgeInsets.only(bottom: 16),
          child: Column(
            children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
                fillColor: Color(0xFFDBEDFF),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Email",
                fillColor: Color(0xFFDBEDFF),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: crm_check,
                    onChanged: (bool value){
                  crmChanged(value);
                }),
                SizedBox(
                  width: 70,
                  height: 60,
                  child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "CRM",
                    fillColor: Color(0xFFDBEDFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                ),
                Checkbox(value: cre_check, onChanged: (bool value){
                  creChanged(value);
                }),
                SizedBox(
                  width: 80,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "CRE",
                      fillColor: Color(0xFFDBEDFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

            ],
          ),
        ),
      ),
    );
  }
}
