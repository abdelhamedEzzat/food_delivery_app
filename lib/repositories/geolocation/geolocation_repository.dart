import 'package:food_delivery_app/repositories/geolocation/base_geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepository implements BaseGeolocationRepository {
  GeolocationRepository();
  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
