import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  final dynamic sismosData;
  final int index;
  GoogleMapScreen(this.sismosData, this.index);
  @override
  _GoogleMapScreenState createState() =>
      _GoogleMapScreenState(this.sismosData, this.index);
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = {};
  final dynamic sismosData;
  final int index;

  _GoogleMapScreenState(this.sismosData, this.index);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      final double lat = sismosData[index]["latitud"];
      final double lng = sismosData[index]["longitud"];
      _markers.add(Marker(
        markerId: MarkerId('id-1'),
        position: LatLng(lat, lng),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double lat = sismosData[index]["latitud"];
    final double lng = sismosData[index]["longitud"];
    return Scaffold(
        appBar: AppBar(
          title: Text('Ubicación del Sismo'),
          backgroundColor: Colors.blueGrey,
        ),
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, lng),
              zoom: 8,
            )));
  }
}
