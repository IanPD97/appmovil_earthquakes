import 'package:appmovil_earthquakes/firstpage.dart';
import 'package:flutter/cupertino.dart';
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
                ? Center(child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background_v4.png'),
                      fit: BoxFit.cover,

                    )
                ),
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: ListView(
                        children: [
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/logo_v2.png',width:120),
                            ],
                          ),
                          SizedBox(height:20),
                          Padding(
                            padding: EdgeInsets.all(30),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset(0,5)
                                )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text('APP DE SISMOLOGIA', style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.blueGrey,
                                    )),
                                  ),
                                  Image.asset('assets/logo-utem.png',width: 50 ,),
                                  SizedBox(height: 10),
                                  Text(_userObj!.displayName! +', lo sentimos, sólo se puede acceder mediante credenciales UTEM',textAlign: TextAlign.center,style: TextStyle(
                                    color: Colors.red.shade300,
                                    fontSize: 16,
                                  ),),
                                  SizedBox(height: 10),

                                  //SizedBox(height: 10),
                                  InkWell(
                                      onTap: (){
                                        _googleSignIn.signOut().then((value) {
                                          setState(() {
                                            _isLoggedIn = false;
                                          });
                                        }).catchError((e) {});
                                      },
                                      child: Container(
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(20),
                                                  child: Text('Cerrar sesión',style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey,
                                                  ))
                                              )
                                            ]
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(130, 115,147,179),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            )
                                        ),
                                      )
                                  ),

                                ],

                              ),
                            ),

                          ),
                          SizedBox(height:137),
                          Text('Sesión iniciada como: ' + _userObj!.email,textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.blueGrey.shade400,
                            fontSize: 13,
                          ),),
                          Text('Desarrollado por UTEM Estudiantes',textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.blueGrey.shade400,
                            fontSize: 16,
                          ),),

                        ]
                    )
                )
            )


            )
                : Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background_v4.png'),
                    fit: BoxFit.cover,

                  )
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: ListView(
                    children: [
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/logo_v2.png',width:120),
                        ],
                      ),
                      SizedBox(height:20),
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0,5)
                            )
                          ],
                        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text('APP DE SISMOLOGIA', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.blueGrey,
                                )),
                              ),
                              Image.asset('assets/logo-utem.png',width: 50 ,),

                              SizedBox(height: 10),

                              //SizedBox(height: 10),
                              InkWell(
                                onTap: (){
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
                                                CupertinoPageRoute(
                                                    builder: (context) => FirstPage(_userObj?.email)));
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
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text('Iniciar sesión con Google',style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ))
                                      )
                                    ]
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(130, 115,147,179),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )
                                  ),
                                )
                              ),

                            ],

                          ),
                        ),

                      ),
                      SizedBox(height:200),
                      Text('Desarrollado por UTEM Estudiantes',textAlign: TextAlign.center,style: TextStyle(
                        color: Colors.blueGrey.shade400,
                        fontSize: 16,
                      ),),
                    ]
                  )
                )
              )

            )
        )
    );
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
