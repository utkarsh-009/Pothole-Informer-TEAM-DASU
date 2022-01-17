import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  bool getLocation = false;
  late CameraPosition potholeMarker;

  MapPage({Key? key}) : super(key: key);

  MapPage.getPothole(double potholeLat, double potHoleLong, {Key? key})
      : super(key: key) {
    potholeMarker = CameraPosition(
        bearing: 0, target: LatLng(potholeLat, potHoleLong), zoom: 15);
    getLocation = true;
  }

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _controller = Completer<GoogleMapController>();
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
        const ImageConfiguration(), "assets/images/RedMarker.png");
    YellowIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/YellowMarker.png");
    BlueIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/BlueMarker.png");
  }

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
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
                position: LatLng(
                  event.docs[index].data()['Latitude'],
                  event.docs[index].data()['Longitude'],
                ),
                infoWindow: InfoWindow(
                  title: "Pothole",
                  snippet: event.docs[index].data()['Description of Pothole'],
                ),
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
        title: const Text("Maps"),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Stack(
        children: [
          GoogleMap(
            markers: _markers,
            mapType: MapType.hybrid,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: widget.getLocation == false
                ? const CameraPosition(
                    target: LatLng(19.0339, 73.0196),
                    zoom: 15,
                  )
                : widget.potholeMarker,
          ),
          Positioned(
            bottom: 110,
            right: 25,
            child: TextButton(
              onPressed: _currentLocation,
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Image.asset(
                    "assets/images/target-icon-4510.png",
                    height: 23,
                  ),
                ),
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _currentLocation() async {
    GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = Location();

    currentLocation = await location.getLocation();

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 15.0,
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
