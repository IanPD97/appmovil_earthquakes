import 'package:appmovil_earthquakes/firstpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isLoggedIn = false;
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
            child: _isLoggedIn
                ? Center(
                    child: Column(children: [
                    Center(
                        child: Icon(Icons.sentiment_dissatisfied_rounded,
                            color: Colors.black, size: 300)),
                    Text(_userObj!.email),
                    Text(_userObj!.displayName!),
                    Text(_userObj!.displayName! +
                        ', lo sentimos: Sólo los usuarios con correo @utem.cl tienen acceso a esta aplicación.'),
                    OutlinedButton(
                      onPressed: () {
                        _googleSignIn.signOut().then((value) {
                          setState(() {
                            _isLoggedIn = false;
                          });
                        }).catchError((e) {});
                      },
                      child: Text("Cerrar Sesión",
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 55),
                          fixedSize: Size(double.infinity, 55)),
                    ),
                  ]))
                : Center(
                    child: OutlinedButton(
                    child: Column(children: [
                      _SignInWith(text: 'Google', icon: 'google')
                    ]),
                    style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        fixedSize: Size(350, 55)),
                    onPressed: () {
                      _googleSignIn.signIn().then((userData) {
                        setState(() {
                          _userObj = userData!;
                          int largo = _userObj!.email.length;
                          String dominio = '';
                          for (int i = 0; i < largo; i++) {
                            String letra = _userObj!.email[i];
                            if (letra == '@') {
                              for (int j = i; j < largo; j++) {
                                String aux = _userObj!.email[j];
                                dominio = dominio + aux;
                              }
                              if (dominio == '@utem.cl') {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => FirstPage()));
                              } else {
                                _isLoggedIn = true;
                                _googleSignIn.signOut();
                              }
                            }
                          }
                        });
                      }).catchError((e) {
                        print(e);
                      });
                    },
                  ))));
  }
}

class _SignInWith extends StatelessWidget {
  final String? text;
  final String? icon;

  const _SignInWith({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(width: 15),
            Image.asset(
              'assets/$icon.png',
              width: 55,
              alignment: Alignment.centerRight,
            ),
            SizedBox(width: 20),
            Text(
              'Iniciar sesión con $text',
              style: GoogleFonts.getFont('Inter',
                  color: Color(0xff757999),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.start,
            ),
          ],
        ));
  }
}
