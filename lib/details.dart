import 'package:flutter/material.dart';
import 'package:appmovil_earthquakes/maps.dart';

class DetailPage extends StatelessWidget {
  final dynamic sismosData;
  final int index;
  DetailPage(this.sismosData, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles del Sismo'),
          backgroundColor: Colors.teal.shade700,
        ),
        body: Container(
            margin: EdgeInsets.all(25),
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Row(children: [
                Expanded(
                    child: Text('Fecha y hora del Sismo:',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.start)),
                Expanded(
                    child: Text("${sismosData[index]["id"]}",
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.right)),
              ]),
              Row(children: [
                Expanded(
                    child: Text('Latitud:',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.start)),
                Expanded(
                    child: Text("${sismosData[index]["latitud"]}",
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.right)),
              ]),
              Row(children: [
                Expanded(
                    child: Text('Longitud:',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.start)),
                Expanded(
                    child: Text("${sismosData[index]["longitud"]}",
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.right)),
              ]),
              Row(children: [
                Expanded(
                    child: Text('Profundidad:',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.start)),
                Expanded(
                    child: Text("${sismosData[index]["profundidad"]}",
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.right)),
              ]),
              Row(children: [
                Expanded(
                    child: Text('Magnitud:',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.start)),
                Expanded(
                    child: Text("${sismosData[index]["magnitud"]}",
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.right)),
              ]),
              Row(children: [
                Expanded(
                    child: Text('Referencia geográfica:',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.start)),
                Expanded(
                    child: Text("${sismosData[index]["referencia_geografica"]}",
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.right)),
              ]),
              const Divider(height: 35, thickness: 3, indent: 1, endIndent: 1),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.place),
                    title: Text("Ver ubicación del Sismo"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GoogleMapScreen(sismosData, index),
                          ));
                    },
                  ),
                ],
              ),
            ])));
  }
}
