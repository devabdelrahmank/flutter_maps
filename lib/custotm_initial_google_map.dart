import 'package:flutter/material.dart';
import 'package:flutter_maps/model/places_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomInitialGoogleMap extends StatefulWidget {
  const CustomInitialGoogleMap({super.key});

  @override
  State<CustomInitialGoogleMap> createState() => _CustomInitialGoogleMapState();
}

class _CustomInitialGoogleMapState extends State<CustomInitialGoogleMap> {
  late CameraPosition initialCameraPosition;
  late CameraTargetBounds cameraTargetBounds;
  late GoogleMapController googleMapController;

  @override
  void initState() {
    cameraTargetBounds = CameraTargetBounds(LatLngBounds(
      southwest: const LatLng(30.554606448552153, 31.46749698735869),
      northeast: const LatLng(30.602560853667516, 31.509556593761317),
    ));
    initialCameraPosition = const CameraPosition(
      target: LatLng(30.576458568386084, 31.50329806592812),
      zoom: 14,
    );
    super.initState();

    initMarkers();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: markers,
            onMapCreated: (controller) {
              googleMapController = controller;
              initMapStyle();
            },
            cameraTargetBounds: cameraTargetBounds,
            initialCameraPosition: initialCameraPosition,
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: ElevatedButton(
              onPressed: () {
                googleMapController.animateCamera(
                  CameraUpdate.newLatLng(
                    const LatLng(
                      30.58859633050808,
                      31.49379079459504,
                    ),
                  ),
                );
              },
              child: const Text("Change Location"),
            ),
          ),
        ],
      ),
    );
  }

  void initMapStyle() async {
    var greenStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style/map_style.json');
    googleMapController.setMapStyle(greenStyle);
  }

  void initMarkers() {
    markers.addAll(
      places
          .map(
            (placeMarker) => Marker(
              markerId: MarkerId(placeMarker.id),
              position: placeMarker.latLng,
              infoWindow: InfoWindow(title: placeMarker.name),
            ),
          )
          .toList(),
    );
  }
}
