import 'package:appmovil_earthquakes/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:appmovil_earthquakes/sign_up_page.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

void main() async {
  runApp(
    MaterialApp(
      home: SignUpPage(),
      //home: FirstPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}



class Demo extends StatefulWidget {
  @override
  DemoState createState() => DemoState();
}

class DemoState extends State<Demo> {
  //

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(title: const Text('Back Button Interceptor Example')),
      body: Container(
        color: Colors.green,
        child: const Center(
          child: Text('Click the Back Button\n'
              'and see the message in the console.'),
        ),
      ),
    );
  }
}
