import 'package:appmovil_earthquakes/firstpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isLoggedIn = false;
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
            child: _isLoggedIn
                ? Column(children: [
                    Image.network(_userObj!.photoUrl!),
                    Text(_userObj!.displayName!),
                    Text(_userObj!.email),
                    TextButton(
                        onPressed: () {
                          _googleSignIn.signOut().then((value) {
                            setState(() {
                              _isLoggedIn = false;
                            });
                          }).catchError((e) {});
                        },
                        child: Text("Cerrar Sesión"))
                  ])
                : Center(
                    child: OutlinedButton(
                    child: Text(
                      'Iniciar sesión con Google',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(70, 70),
                        fixedSize: Size(320, 50)),
                    onPressed: () {
                      _googleSignIn.signIn().then((userData) {
                        setState(() {
                          _isLoggedIn = true;
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => FirstPage()));
                          _userObj = userData!;
                        });
                      }).catchError((e) {
                        print(e);
                      });
                    },
                  ))));
  }

  // Future signIn() async {
  //   final user = await GoogleSignInApi.login();

  //   if (user == null) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Sign in Failed")));
  //   } else {
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => FirstPage()));
}