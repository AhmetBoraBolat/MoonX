import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:moon_x/app/core/consturactor/sharedpref_key.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/core/helper/shared_preferences_helper.dart';

class LocationPermissionBox extends StatefulWidget {
  const LocationPermissionBox({Key? key}) : super(key: key);

  @override
  State<LocationPermissionBox> createState() => _LocationPermissionBoxState();
}

class _LocationPermissionBoxState extends State<LocationPermissionBox> {
  String? userCity;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    ScreenSize.init(context);
    await _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, cannot request permissions.');
    }

    final Position position = await Geolocator.getCurrentPosition();
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    final userPlacemark = placemarks.first;

    final latitude = position.latitude;
    final longitude = position.longitude;

    SharedPreferencesHelper.saveDoubleData(
        SharedPrefKeys.latitude.name.toString(), latitude);
    SharedPreferencesHelper.saveDoubleData(
        SharedPrefKeys.longitude.name.toString(), longitude);

    setState(() {
      userCity = userPlacemark.locality ?? userPlacemark.administrativeArea;
      SharedPreferencesHelper.saveStringData(
          SharedPrefKeys.userCity.name.toString(), userCity!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _getUserLocation();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF181D38),
        ),
        width: ScreenSize.screenWidth * 0.8,
        height: ScreenSize.screenHeight * 0.065,
        alignment: Alignment.center,
        child: Text(
          userCity ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
