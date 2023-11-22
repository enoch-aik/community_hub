import 'dart:async';

import 'package:community_hub/lib.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage(name: 'dashboardMap')
class DashboardMapScreen extends StatefulWidget {
  const DashboardMapScreen({super.key});

  @override
  State<DashboardMapScreen> createState() => DashboardMapScreenState();
}

class DashboardMapScreenState extends State<DashboardMapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(56.159269, 15.591571),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
       bearing: 192.8334901395799,
      target: LatLng(56.159269, 15.591571),
       tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,myLocationEnabled: true,myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
