import 'dart:convert';

import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';
import 'package:geocoding_web/api/geocoding_api.dart';
import 'package:geocoding_web/mapper.dart';
import 'package:geocoding_web/models/location_search_response_item.dart';
import 'package:geocoding_web/models/location_reverse_response_item.dart';
import 'package:http/http.dart' as http;

const String baseURL = "https://nominatim.openstreetmap.org";
const String reverseURL = '$baseURL/reverse';
const String searchURL = '$baseURL/search';

class NominatimApi implements GeocodingNetworkProxy {
  @override
  Future<List<Location>> geocode(String address, String locale) async {
    var searchURI =
        Uri.parse('$searchURL?q=$address&format=jsonv2&accept-languge=$locale');
    var response = await http.get(searchURI);
    if (response.statusCode == 200) {
      List<dynamic> decodedResults = json.decode(response.body);
      var searchResults =
          decodedResults.map((e) => LocationSearchResponseItem.fromJson(e));
      if (searchResults.isNotEmpty) {
        return searchResults
            .map((e) => Mapper.mapLocationSearchResponseItemToLocation(e))
            .toList();
      }
    }
    return [];
  }

  @override
  Future<List<Placemark>> reverseGeocode(
      double longitude, double latitude, String? locale) async {
    var searchURI = Uri.parse(
        '$reverseURL?lat=$latitude&lon=$longitude&format=jsonv2&accept-languge=$locale');
    var response = await http.get(searchURI);
    if (response.statusCode == 200) {
      dynamic decodedResults = json.decode(response.body);
      var searchResults = LoctionReverseResponseItem.fromJson(decodedResults);
      if (searchResults.error == null || searchResults.error!.isEmpty) {
        return [Mapper.mapLoctionReverseResponseItemToPlacemark(searchResults)];
      }
    }
    return [];
  }
}
