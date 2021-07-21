import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appmovil_earthquakes/details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic data = [];
  dynamic sismosData = [];
  getReportes() async {
    http.Response response =
        await http.get(Uri.parse('http://localhost:3000/grupo-w/earthquakes/'));
    data = json.decode(response.body);
    setState(() {
      sismosData = data['Sismos'];
    });
  }

  @override
  void initState() {
    super.initState();
    getReportes();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Lista de Sismos'),
            backgroundColor: Colors.teal.shade700,
            actions: [
              IconButton(
                onPressed: getReportes,
                icon: Icon(Icons.refresh_sharp),
                iconSize: 25.0,
              )
            ]),
        body: ListView.builder(
          itemCount: sismosData == null ? 0 : sismosData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.radar,
                        color: Colors.teal.shade700, size: 32.0),
                    title: Container(
                        child: Column(
                      children: <Widget>[
                        Row(children: [
                          Expanded(
                              child: Text(
                                  "${sismosData[index]["referencia_geografica"]}",
                                  style: const TextStyle(fontSize: 16),
                                  textAlign: TextAlign.start)),
                          Expanded(
                              child: Text("${sismosData[index]["id"]}",
                                  style: const TextStyle(fontSize: 13),
                                  textAlign: TextAlign.right)),
                        ])
                      ],
                    )),
                    subtitle:
                        Text("Magnitud: ${sismosData[index]["magnitud"]}"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(sismosData, index),
                          ));
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
