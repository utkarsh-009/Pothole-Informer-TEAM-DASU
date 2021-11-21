// ignore_for_file: prefer_const_constructors

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

  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      controller.setMapStyle(Utils.mapStyle);
      setState(
        () {
          _markers.add(
            Marker(
              markerId: MarkerId("id 1"),
              position: LatLng(19.031, 73.014),
              infoWindow:
                  InfoWindow(title: "Pothole", snippet: "Pothole here!"),
              icon: BlueIcon,
            ),
          );
          _markers.add(
            Marker(
              markerId: MarkerId("id 2"),
              position: LatLng(19.035, 73.011),
              infoWindow:
                  InfoWindow(title: "Pothole", snippet: "Pothole here!"),
              icon: RedIcon,
            ),
          );
          _markers.add(
            Marker(
              markerId: MarkerId("id 3"),
              position: LatLng(19.0339, 73.0196),
              infoWindow:
                  InfoWindow(title: "Pothole", snippet: "Pothole here!"),
              icon: YellowIcon,
            ),
          );
        },
      );
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
