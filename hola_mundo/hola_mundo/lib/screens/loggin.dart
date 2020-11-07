import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hola_mundo/models/user.dart';
import 'package:hola_mundo/utils/string_adm.dart';
import 'package:hola_mundo/Providers/UserPrv.dart';
import 'package:provider/provider.dart';

class Loggin extends StatefulWidget {
  const Loggin({Key key}) : super(key: key);

  _LogginState createState() => _LogginState();
}

class _LogginState extends State<Loggin> {
  User user = User();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserPrv userProvider = Provider.of<UserPrv>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Crear Cuenta'),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Image(
                        image: AssetImage(
                            'assets/images/undraw_text_field_htlv.png')),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z]+|\s'))
                          ],
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Ingrese su nombre';
                            }
                            if (value.contains(new RegExp(r'[0-9]'))) {
                              return 'No puede ingresar numeros';
                            }
                            if (value.length < 4) {
                              return 'Nombre demasiado corto';
                            }
                            user.name = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Nombre',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'\s'))
                            ],
                            validator: (value) {
                              if (value.isEmpty) {
                                print('No se ingreso un Email');
                                return 'Debes ingresar tu Email';
                              }
                              if (!StringAdm.validateEmail(value)) {
                                return 'Ingresa un Email valido';
                              }
                              user.email = value;
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 10,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Ingrese su número de teléfono';
                            }

                            user.phone = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Teléfono',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            validator: (value) {
                              if (value.length < 4) {
                                return 'Contraseña demasiado corta';
                              }
                              user.password = value;
                              return null;
                            },
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 10,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              prefixIcon: Icon(Icons.security_outlined),
                              hintText: 'Contraseña',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (!StringAdm.validatePasswords(
                                value, user.password)) {
                              return 'Las contraseñas no coinciden';
                            }
                            return null;
                          },
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            prefixIcon: Icon(Icons.security_outlined),
                            hintText: 'Confirmar contraseña',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: LogginButton(
                                formKey: _formkey,
                                user: user,
                                userProvider: userProvider),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class LogginButton extends StatelessWidget {
  const LogginButton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.user,
    @required this.userProvider,
  })  : _formKey = formKey,
        super(key: key);
  final GlobalKey<FormState> _formKey;
  final User user;
  final UserPrv userProvider;

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (!_formKey.currentState.validate()) {
          return;
        }

        print('Todo bien');
        print(user.email);
        print(user.password);
        final sb = SnackBar(
          content: Text('¡Los datos se han guardado!'),
        );

        Scaffold.of(context).showSnackBar(sb);
        userProvider.user = user;
        userProvider.users = user;
        _formKey.currentState.save();
        await Future.delayed(Duration(seconds: 3));
        Navigator.pop(context);
      },
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'CREAR CUENTA',
            style: TextStyle(fontSize: 25, color: Colors.white),
          )),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromRGBO(252, 79, 50, 1),
        ),
      ),
    );
  }
}

/*Form(
                key: _formkey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]+|\s'))
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Ingrese su nombre';
                          }
                          if (value.contains(new RegExp(r'[0-9]'))) {
                            return 'No puede ingresar números';
                          }
                          if (value.length < 4) {
                            return 'Nombre demasiado corto';
                          }
                          user.name = value;
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Nombre',
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s'))
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Debes ingresar tu Email';
                          }
                          if (!StringAdm.validateEmail(value)) {
                            return 'Ingresa un Email valido';
                          }
                          user.email = value;
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Ingrese su numero de Teléfono';
                          }
                          if (value.length != 10) {
                            return 'Ingrese exactamente 10 digitos';
                          }
                          user.phone = value;
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Teléfono',
                            icon: Icon(
                              Icons.phone_android,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextFormField(
                        validator: (value) {
                          if (value.length < 4) {
                            return 'Contraseña demasiado corta';
                          }
                          user.password = value;
                          return null;
                        },
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            labelText: 'Contraseña',
                            icon: Icon(
                              Icons.security_outlined,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextFormField(
                        validator: (value) {
                          if (!StringAdm.validatePasswords(
                              value, user.password)) {
                            return 'Las contraseñas no coinciden';
                          }
                          return null;
                        },
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            labelText: 'Confirmar contraseña',
                            icon: Icon(
                              Icons.security_outlined,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 79, 50, 1),
                        borderRadius: BorderRadius.circular(15)),
                    width: 320,
                    height: 65,
                    margin: EdgeInsets.only(top: 50),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                        if (!_formkey.currentState.validate()) {
                          return;
                        }
                        print(' ');
                        print(user.email);
                        final sb = SnackBar(
                          content: Text('Los datos se han guardado'),
                        );
                        Scaffold.of(context).showSnackBar(sb);
                        userProvider.user = user;
                        userProvider.users = user;
                        _formkey.currentState.save();
                        await Future.delayed(Duration(seconds: 3));
                        //Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'CREAR CUENTA',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
