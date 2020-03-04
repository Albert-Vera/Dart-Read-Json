import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget{

  Pantalla2(this.name, this.imagesrc);


  String name, imagesrc;
  //String url = "https://ringsdb.com" + imagesrc;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
            child: Hero(
              tag: name,
                child: Image.network('https://ringsdb.com/' + imagesrc)),
          )
        ],
      ),
    );
  }


}