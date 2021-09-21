import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';
import 'package:geocoding_web/models/location_reverse_response_item.dart';
import 'package:geocoding_web/models/location_search_response_item.dart';

abstract class Mapper {
  static Location mapLocationSearchResponseItemToLocation(
      LocationSearchResponseItem responseItem) {
    return Location(
        latitude: double.parse(responseItem.lat),
        longitude: double.parse(responseItem.lon),
        timestamp: DateTime.now().toUtc());
  }

  static Placemark mapLoctionReverseResponseItemToPlacemark(
      LoctionReverseResponseItem responseItem) {
    return Placemark(
        administrativeArea:
            responseItem.address?.state ?? responseItem.address?.city,
        country: responseItem.address?.country,
        postalCode: responseItem.address?.postcode,
        street:
            "${responseItem.address?.road} ${responseItem.address?.houseNumber}",
        name: responseItem.name ?? responseItem.address?.houseNumber,
        isoCountryCode: responseItem.address?.countryCode?.toUpperCase(),
        locality:
            responseItem.address?.municipality ?? responseItem.address?.city,
        subAdministrativeArea:
            responseItem.address?.county ?? responseItem.address?.municipality,
        thoroughfare: responseItem.address?.road,
        subThoroughfare: responseItem.address?.houseNumber,
        subLocality: "");
  }
}
