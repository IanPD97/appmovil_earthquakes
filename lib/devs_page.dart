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
          backgroundColor: Colors.blueGrey,
          centerTitle: false,
        ),
        body: Container(
            child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: Column(children: <Widget>[
                ListTile(
                  leading: ClipRRect(
                    child: Image.asset(
                      'assets/ipinza.jpg',
                      width: 50,
                      height: 50,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  ),
                  title: Text("Nicolás Ipinza"),
                  subtitle: Text(
                      "Estudiante de ingeniería civil en computación UTEM   Computación Paralela y Distribuida"),
                  trailing: Text('Grupo-W'),
                ),
              ])),
            ]),
            Row(children: [
              Expanded(
                  child: Column(children: <Widget>[
                ListTile(
                  leading: ClipRRect(
                    child: Image.asset(
                      'assets/poveda.jpg',
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  ),
                  title: Text("Ian Poveda"),
                  subtitle: Text(
                      "Estudiante de ingeniería civil en computación UTEM   Computación Paralela y Distribuida"),
                  trailing: Text('Grupo-W'),
                ),
              ]))
            ]),
          ],
        )));
  }
}
