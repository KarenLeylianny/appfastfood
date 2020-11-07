import 'package:flutter/material.dart';
import 'package:hola_mundo/screens/loggin.dart';
import 'package:hola_mundo/models/user.dart';
import 'package:hola_mundo/utils/string_adm.dart';
import 'package:hola_mundo/Providers/UserPrv.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  User user = User();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String nombre = "";
  final nombreController = TextEditingController();
  @override
  void dispose() {
    nombreController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final UserPrv userProvider = Provider.of<UserPrv>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(252, 79, 50, 1),
        title: Row(
          children: [Text('Crear Cuenta')],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Image.asset(
                  'assets/images/undraw_authentication_fsn5.png',
                  colorBlendMode: BlendMode.color,
                  width: 270,
                  height: 187,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                child: Text(
                  'Ingresa tus credenciales',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    height: 1,
                    color: Colors.black,
                    fontSize: 23,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                child: Text(
                  'registradas para acceder',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    height: 1.0,
                    color: Colors.black,
                    fontSize: 23.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          print('No se ingreso email');
                          return 'Debes ingresar tu email';
                        }
                        if (!StringAdm.validateEmail(value)) {
                          return 'Ingresa un Email valido';
                        }
                        user.email = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        prefixIcon: Icon(Icons.mail_sharp),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Debes ingresar tu contraseña';
                          }
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
                              Radius.circular(20.0),
                            ),
                          ),
                          prefixIcon: Icon(Icons.security_outlined),
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '¿Aún no tienes una cuenta?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loggin()));
                          },
                          child: Text(
                            'Haz click aqui',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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
            ),
          ],
        ),
      ),
    );
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
        final sb = SnackBar(
          content: Text('¡Usuario o contraseñas incorrectos'),
        );
        final snackBartoDashBorad = SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('Ingresando a tu DashBoard'),
              ),
            ],
          ),
        );

        if (!_formKey.currentState.validate()) {
          return;
        }
        var retUsr = userProvider.getUser(user.email);
        print(retUsr.password);
        if (retUsr != null) {
          if (!StringAdm.validatePasswords(retUsr.password, user.password)) {
            Scaffold.of(context).showSnackBar(sb);
            print('Las contraseñas no coinciden');
          } else {
            Scaffold.of(context).showSnackBar(snackBartoDashBorad);
            await Future.delayed(Duration(seconds: 3));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dashboard(retUsr.name),
                ));
            print('Credenciales validas');
          }
        } else {
          Scaffold.of(context).showSnackBar(sb);
          print('Credenciales no validaS');
        }
        _formKey.currentState.save();
      },
      child: Text(
        'CONTINUAR',
        style: TextStyle(fontSize: 28, color: Colors.white),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromRGBO(252, 79, 50, 1),
        ),
      ),
    );
  }
}
/*appBar: AppBar(
        title: Text('Login'),
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
                          'assets/images/undraw_authentication_fsn5.png')),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0.0, 0.0),
                  child: Text(
                    'Ingresa tus credenciales',
                    style: TextStyle(
                        color: Color.fromARGB(71, 34, 18, 1),
                        fontSize: 20.0,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    'registradas para acceder',
                    style: TextStyle(
                        color: Color.fromARGB(71, 34, 18, 1),
                        fontSize: 20.0,
                        decoration: TextDecoration.none),
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
                              Icons.mail_sharp,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '¿No tienes una cuenta?',
                    style: TextStyle(
                      color: Color(0xff7C7A7A),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Loggin())); //para ir a otra pagina
                    },
                    child: Text(
                      'Crear Ahora',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: TextButton(
                  onPressed: () {
                    nombre = nombreController.text;
                    print("El nombre que escribiste es: $nombre");
                  },
                  child: Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 79, 50, 1),
                        borderRadius: BorderRadius.circular(15)),
                    width: 320,
                    height: 65,
                    margin: EdgeInsets.only(top: 50),
                    child: FlatButton(
                      onPressed: () {
                        final sb = SnackBar(
                          content: Text('¡Usuario o contraseña incorrectos!'),
                        );
                        print("El nombre es: $user.email");
                        print("La contraseña es: $user.password");
                        if (!_formkey.currentState.validate()) {
                          return;
                        }
                        var retUsr = userProvider.getUser(user.email);
                        if (retUsr != null) {
                          if (!StringAdm.validatePasswords(
                              retUsr.password, user.password)) {
                            Scaffold.of(context).showSnackBar(sb);
                            print('Contraseñas no coinciden');
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loggin()));
                            print('Credenciales validas');
                          }
                        } else {
                          Scaffold.of(context).showSnackBar(sb);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          'CONTINUAR',
                          style: TextStyle(
                            fontSize: 28,
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
