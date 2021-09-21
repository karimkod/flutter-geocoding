import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'injection.dart';

class GeocodingPlugin extends GeocodingPlatform {
  static void registerWith(Registrar registrar) {
    GeocodingPlatform.instance = GeocodingPlugin();
  }

  @override
  Future<List<Location>> locationFromAddress(
    String address, {
    String? localeIdentifier,
  }) async {
    localeIdentifier = localeIdentifier ?? languageRetriever.language;

    List<Location> locations =
        await networkProxy.geocode(address, localeIdentifier);

    if (locations.isEmpty) throw const NoResultFoundException();

    return locations;
  }

  @override
  Future<List<Placemark>> placemarkFromCoordinates(
    double latitude,
    double longitude, {
    String? localeIdentifier,
  }) async {
    localeIdentifier = localeIdentifier ?? languageRetriever.language;

    List<Placemark> placemarks = await networkProxy.reverseGeocode(
        longitude, latitude, localeIdentifier);

    if (placemarks.isEmpty) throw const NoResultFoundException();

    return placemarks;
  }
}
