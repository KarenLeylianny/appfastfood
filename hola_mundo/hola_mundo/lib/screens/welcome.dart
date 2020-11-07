import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hola_mundo/screens/login.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 249, 239),
      child: Column(
        mainAxisSize:
            MainAxisSize.max, //ocupo toda la pantalla en forma vertical y llena
        crossAxisAlignment: CrossAxisAlignment.start, //izquierda horizontal

        children: [
          Image(
            image: AssetImage('assets/images/balloon-shape.png'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0), //top es solo arriba
              child: Image(
                image: AssetImage('assets/images/FastFood-Logo.png'),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: Image(
                image: AssetImage('assets/images/online_groceries.png'),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                'El directorio de comida',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Center(
            child: new Text(
              'Busca. Encuentra. Pide',
              style: TextStyle(
                color: Color.fromRGBO(71, 34, 18, 1),
                fontSize: 18.0,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Center(
            child: Text(
              'Recibe. Disfruta',
              style: TextStyle(
                color: Color.fromRGBO(71, 34, 18, 1),
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: FlatButton(
                minWidth: 300,
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                textColor: Colors.white,
                color: Color.fromRGBO(252, 79, 50, 1),
                child: Text(
                  "INICIA AHORA",
                  style: TextStyle(fontSize: 26),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                  //respuesta al presionar el boton
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
