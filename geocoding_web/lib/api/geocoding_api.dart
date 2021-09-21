import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';

abstract class GeocodingNetworkProxy {
  Future<List<Placemark>> reverseGeocode(
      double longitude, double latitude, String locale);
  Future<List<Location>> geocode(String address, String locale);
}
