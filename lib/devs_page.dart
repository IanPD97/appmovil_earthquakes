import 'package:flutter/material.dart';

class DevsPage extends StatefulWidget {
  @override
  _DevsPageState createState() => _DevsPageState();
}

class _DevsPageState extends State<DevsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Desarrolladores'),
          backgroundColor: Colors.teal.shade700,
          centerTitle: true,
        ),
        body: Container(
            child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: Column(children: <Widget>[
                ListTile(
                  leading: Icon(Icons.sentiment_very_dissatisfied_outlined),
                  title: Text("Nicolás Ipinza"),
                  subtitle: Text(
                      "Estudiante de ingeniería civil en computación UTEM, Computación paralela y distribuida"),
                ),
              ])),
            ]),
            Row(children: [
              Expanded(
                  child: Column(children: <Widget>[
                ListTile(
                  leading: Icon(Icons.sentiment_very_dissatisfied_outlined),
                  title: Text("Ian Poveda"),
                  subtitle: Text(
                      "Estudiante de ingeniería civil en computación UTEM, Computación paralela y distribuida"),
                ),
              ]))
            ]),
          ],
        )));
  }
}
