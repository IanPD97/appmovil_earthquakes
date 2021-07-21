import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  runApp(
    MaterialApp(home: HomePage()),
  );
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

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
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: sismosData == null ? 0 : sismosData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.radar),
                    title: Text(
                        "Fecha y hora del sismo: ${sismosData[index]["id"]}"),
                    subtitle:
                        Text("Magnitud: ${sismosData[index]["magnitud"]}"),
                    onTap: () {/* ... */},
                  ),
                ],
              ),
            );
          },
        ));
  }
}
