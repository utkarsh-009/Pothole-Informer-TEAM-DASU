// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late BitmapDescriptor RedIcon;
  late BitmapDescriptor YellowIcon;
  late BitmapDescriptor BlueIcon;
  List<LatLng> locations = [];
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    setCustomMarkerIcon();
  }

  void setCustomMarkerIcon() async {
    RedIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/RedMarker.png");
    YellowIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/YellowMarker.png");
    BlueIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/BlueMarker.png");
  }

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      controller.setMapStyle(Utils.mapStyle);
      FirebaseFirestore.instance
          .collection("Pothole Details")
          .snapshots()
          .listen((event) {
        setState(() {
          for (int index = 0; index < event.docs.length; index++) {
            _markers.add(
              Marker(
                markerId: MarkerId(index.toString()),
                position: LatLng(event.docs[index].data()['Latitude'],
                    event.docs[index].data()['Longitude']),
                infoWindow: InfoWindow(
                    title: "Pothole",
                    snippet:
                        event.docs[index].data()['Description of Pothole']),
                icon: BlueIcon,
              ),
            );
          }
        });
      });
      setState(() {});
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text("Maps"),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: GoogleMap(
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(19.0339, 73.0196),
          zoom: 15,
        ),
      ),
    );
  }
}

class Utils {
  static String mapStyle = '''
      [
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
]
  ''';
}