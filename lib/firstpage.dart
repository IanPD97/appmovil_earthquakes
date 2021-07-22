import 'package:appmovil_earthquakes/homepage.dart';
import 'package:appmovil_earthquakes/devs_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registros de Sismología'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
            child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: Column(children: <Widget>[
                ListTile(
                  leading: Icon(Icons.sensors_rounded),
                  title: Text("Ver registros de Sismos"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                ),
              ]))
            ]),
            const Divider(
              height: 20,
              thickness: 1.5,
              indent: 10,
              endIndent: 10,
              color: Colors.blueGrey,
            ),
            Row(children: [
              Expanded(
                  child: Column(children: <Widget>[
                ListTile(
                  leading: Icon(Icons.developer_mode),
                  title: Text("Ver Desarrolladores"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DevsPage(),
                        ));
                  },
                ),
              ]))
            ]),
          ],
        )));
  }
}
