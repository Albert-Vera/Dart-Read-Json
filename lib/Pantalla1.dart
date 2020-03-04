import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:leer_json/Pantalla2.dart';
import 'package:http/http.dart' as http;

class Pantalla1 extends StatefulWidget {

  PantallaState createState() => PantallaState();
}

class PantallaState extends State<Pantalla1>{

  var elementos = [];


  @override
  void initState() {
    super.initState();
    descargarJson();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: elementos.length,
            itemBuilder: (context, index) =>
                Container(
                  margin: EdgeInsets.only(
                      top: 25.0,
                    left: 90.0,
                    right: 90.0,
                  ),
                  height: 140.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFFfeb800),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Pantalla2(elementos[index]["name"], elementos[index]["imagesrc"]),
                      ));
                    },
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(elementos[index]["name"],
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          Hero(
                            tag: elementos[index]["name"],
                              child: Image.network('https://ringsdb.com/' + elementos[index]["imagesrc"]))
                        ],
                      ),
                  ),
                ),
        ),
      ),
    ),
    );
  }

  descargarJson() async{
    var respuesta = await http.get("https://ringsdb.com/api/public/cards/");
    setState((){
      elementos = jsonDecode(respuesta.body);
    });
  }
}