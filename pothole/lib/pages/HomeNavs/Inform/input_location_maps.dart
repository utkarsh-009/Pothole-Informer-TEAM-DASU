// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, no_logic_in_create_state

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class InputLocation extends StatefulWidget {
  final location;

  const InputLocation({Key? key, required this.location}) : super(key: key);

  @override
  State<InputLocation> createState() => _InputLocationState(location);
}

class _InputLocationState extends State<InputLocation> {
  late BitmapDescriptor BlueIcon;
  LatLng location;
  final _controller = Completer<GoogleMapController>();

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
  MapType _currentMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      controller.setMapStyle(Utils.mapStyle);
      _controller.complete(controller);
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

    void _toggleMapType() {
      setState(() {
        _currentMapType = (_currentMapType == MapType.normal)
            ? MapType.hybrid
            : MapType.normal;
      });
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
      body: Stack(
        children: [
          GoogleMap(
            markers: _markers,
            onMapCreated: _onMapCreated,
            mapType: _currentMapType,
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
          Positioned(
            bottom: 90,
            right: 20,
            child: TextButton(
              onPressed: _currentLocation,
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Image.asset(
                    "assets/images/target-icon-4510.png",
                    height: 28,
                  ),
                ),
                elevation: 7,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.layers,
          size: 30,
        ),
        onPressed: _toggleMapType,
        heroTag: null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = Location();

    currentLocation = await location.getLocation();

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 17.0,
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
