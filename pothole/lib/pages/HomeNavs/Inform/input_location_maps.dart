// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InputLocation extends StatefulWidget {
  final location;

  const InputLocation({Key? key, required this.location}) : super(key: key);

  @override
  State<InputLocation> createState() => _InputLocationState(location);
}

class _InputLocationState extends State<InputLocation> {
  late BitmapDescriptor BlueIcon;
  LatLng location;

  _InputLocationState(this.location);

  @override
  void initState() {
    super.initState();
    setCustomMarkerIcon();
  }

  void setCustomMarkerIcon() async {
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
              position: location,
              icon: BlueIcon,
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, location);
            },
            child: Text(
              "Confirm Location",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
      body: GoogleMap(
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: location,
          zoom: 15,
        ),
        onTap: (position) {
          location = position;
          _markers.clear();
          _markers.add(
            Marker(
              markerId: MarkerId("id 1"),
              position: location,
              infoWindow:
                  InfoWindow(title: "Pothole", snippet: "Pothole here!"),
              icon: BlueIcon,
            ),
          );
          setState(() {});
        },
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
