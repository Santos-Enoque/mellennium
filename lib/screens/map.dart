import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteMap extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<RouteMap> {

  final Set<Marker> _markers = {};
  final Set<Polyline> poly = {};

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(-25.978415, 32.585988),
        zoom: 13.9,
      ),
      markers: _markers,
      polylines: poly,
    );
  }

  void getMaps() async {
    DocumentSnapshot snapshot = await Firestore.instance.collection('ui')
        .document('map').get();
    setState(() {
      List markers = snapshot.data['markers'];
      List polylines = snapshot.data['polylines'];
      for (var marker in markers) {
        _addMarker(LatLng(marker['latitude'], marker['longitude']), marker['label']);
      }
      List<LatLng> route = [];
      for (var polyline in polylines) {
        route.add(LatLng(polyline['latitude'], polyline['longitude']));
      }
      var uuid = new Uuid();
      poly.add(
          Polyline(
              polylineId: PolylineId(uuid.v1()),
              width: 3,
              color: Colors.pink,
              points: route
          )
      );
    });
  }

  void _addMarker(LatLng position, String destination) {
    var uuid = new Uuid();
    String markerId = uuid.v1();
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(markerId),
          position: position,
          infoWindow: InfoWindow(title: destination,),
          icon: BitmapDescriptor.defaultMarkerWithHue(330)));
    });
  }

  @override
  void initState() {
    getMaps();
  }

}
