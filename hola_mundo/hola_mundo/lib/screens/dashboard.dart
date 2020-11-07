import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  String name;
  Dashboard(this.name);
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Color(0xfff44336),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 30, 0, 0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Hola ' + widget.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              flex: 7,
                            ),
                            Expanded(
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Image.asset(
                                  "assets/images/persona.png",
                                  colorBlendMode: BlendMode.color,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              '¿Qué quieres comer hoy?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 15, 10, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFC836E),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 10.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffFC836E),
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                              hintText: 'Buscar platillos o restaurantes',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
              //Populares acerca para ti
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 0, 8),
                    child: Text(
                      'Populares cerca para ti',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              ),

              Container(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Card(
                        child: Container(
                          width: 230,
                          height: 185,
                          color: Colors.white10,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/burger.png',
                                    //  colorBlendMode: BlendMode.color,
                                    width: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        ' Mc Burger',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "Poppins-Bold",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text('   Hamburgesas'),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child: Text('Nachos'),
                                      ),
                                      Expanded(
                                        child: Text('Alitas'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        '4.7',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xfffeefd5),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                              Text('300m   ')
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xfffeefd5),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                              Text('20  ')
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        elevation: 10,
                      ),
                      Card(
                        child: Container(
                          width: 230,
                          height: 185,
                          color: Colors.white10,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/tacos.png',
                                    //  colorBlendMode: BlendMode.color,
                                    width: double.infinity,
                                    height: 95,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        ' Tacos Tao',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "Poppins-Bold",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text('   Tacos al pastor'),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        child: Text('Gringas'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        '4.0',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xfffeefd5),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                              Text('100m   ')
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xfffeefd5),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                              Text('10  ')
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        elevation: 10,
                      ),
                    ],
                  )),
              Row(
                //Explorar categorias
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 0, 8),
                    child: Text(
                      'Explorar categorias',
                      style: TextStyle(fontSize: 20, color: Color(0xffF472212)),
                    ),
                  )
                ],
              ),
              Container(
                ///rapida
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      elevation: 8,
                      child: Container(
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color(0xffFC4F32),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                'assets/images/hamburguesa.png',
                                //  colorBlendMode: BlendMode.color,
                                width: double.infinity,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Rapida',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text('150 Lugares',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            )
                          ],
                        ),
                      ),
                    ), //1
                    Card(
                      elevation: 10,
                      child: Container(
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color(0xff675CE8),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                'assets/images/ensalada.png',
                                //  colorBlendMode: BlendMode.color,
                                width: double.infinity,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Ensaladas',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text('20 Lugares',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            )
                          ],
                        ),
                      ),
                    ), //2
                    Card(
                      elevation: 10,
                      child: Container(
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color(0xff239F55),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                'assets/images/verde.png',
                                //  colorBlendMode: BlendMode.color,
                                width: double.infinity,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Postres',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text('43 Lugares',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            )
                          ],
                        ),
                      ),
                    ), //3
                    Card(
                      elevation: 10,
                      child: Container(
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color(0xffF6A03A),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                'assets/images/pez.png',
                                //  colorBlendMode: BlendMode.color,
                                width: double.infinity,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Mariscos',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text('71 Lugares',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            )
                          ],
                        ),
                      ),
                    ) //4
                  ],
                ),
              ),
              Row(
                //Recomendados
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 0, 8),
                    child: Text(
                      'Recomendados',
                      style: TextStyle(fontSize: 20, color: Color(0xffF472212)),
                    ),
                  )
                ],
              ),
              Container(
                //Recomendados
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                          width: 180,
                          height: 200,
                          color: Colors.white10,
                          child: Card(
                            child: Container(
                              width: 180,
                              height: 200,
                              color: Colors.blue[50],
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/sushi.png',
                                        //  colorBlendMode: BlendMode.color,
                                        width: double.infinity,
                                        height: 80,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Sushi Grill',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "Poppins-Bold",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 5, 0, 5),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                                'Sushi, Pescado fresco, Ramen, Ensaladas'),
                                            flex: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 30,
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            elevation: 10,
                          )),
                    ),
                    Card(
                      elevation: 10,
                      child: Container(
                          width: 180,
                          height: 230,
                          color: Colors.white10,
                          child: Card(
                            child: Container(
                              width: 180,
                              height: 200,
                              color: Colors.blue[50],
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/yucateca.png',
                                        //  colorBlendMode: BlendMode.color,
                                        width: double.infinity,
                                        height: 80,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Boxito Lindo',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "Poppins-Bold",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 5, 0, 5),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                                'Comida tradicional Yucateca'),
                                            flex: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 30,
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            elevation: 10,
                          )),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 0, 8),
                    child: Text(
                      'Más información',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
