class LoctionReverseResponseItem {
  int? placeId;
  String? licence;
  String? osmType;
  int? osmId;
  String? lat;
  String? lon;
  int? placeRank;
  String? category;
  String? type;
  double? importance;
  String? addresstype;
  String? name;
  String? displayName;
  Address? address;
  List<String>? boundingbox;
  String? error;

  LoctionReverseResponseItem(
      {required this.placeId,
      required this.licence,
      required this.osmType,
      required this.osmId,
      required this.lat,
      required this.lon,
      required this.placeRank,
      required this.category,
      required this.type,
      required this.importance,
      required this.addresstype,
      required this.name,
      required this.displayName,
      this.address,
      required this.boundingbox,
      required this.error});

  LoctionReverseResponseItem.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    licence = json['licence'];
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    lat = json['lat'];
    lon = json['lon'];
    placeRank = json['place_rank'];
    category = json['category'];
    type = json['type'];
    importance = json['importance'];
    addresstype = json['addresstype'];
    name = json['name'];
    displayName = json['display_name'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    boundingbox = json['boundingbox'].cast<String>();
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['place_id'] = placeId;
    data['licence'] = licence;
    data['osm_type'] = osmType;
    data['osm_id'] = osmId;
    data['lat'] = lat;
    data['lon'] = lon;
    data['place_rank'] = placeRank;
    data['category'] = category;
    data['type'] = type;
    data['importance'] = importance;
    data['addresstype'] = addresstype;
    data['name'] = name;
    data['display_name'] = displayName;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['boundingbox'] = boundingbox;
    data['error'] = error;
    return data;
  }
}

class Address {
  String? houseNumber;
  String? road;
  String? neighbourhood;
  String? suburb;
  String? municipality;
  String? state;
  String? region;
  String? postcode;
  String? country;
  String? countryCode;
  String? city;
  String? county;

  Address(
      {required this.houseNumber,
      required this.road,
      required this.neighbourhood,
      required this.suburb,
      required this.municipality,
      required this.state,
      required this.region,
      required this.postcode,
      required this.country,
      required this.countryCode,
      required this.city,
      required this.county});

  Address.fromJson(Map<String, dynamic> json) {
    houseNumber = json['house_number'];
    road = json['road'];
    neighbourhood = json['neighbourhood'];
    suburb = json['suburb'];
    municipality = json['municipality'];
    state = json['state'];
    region = json['region'];
    postcode = json['postcode'];
    country = json['country'];
    countryCode = json['country_code'];
    county = json['county'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['house_number'] = houseNumber;
    data['road'] = road;
    data['neighbourhood'] = neighbourhood;
    data['suburb'] = suburb;
    data['municipality'] = municipality;
    data['state'] = state;
    data['region'] = region;
    data['postcode'] = postcode;
    data['country'] = country;
    data['country_code'] = countryCode;
    data['county'] = county;
    data['city'] = city;
    return data;
  }
}
