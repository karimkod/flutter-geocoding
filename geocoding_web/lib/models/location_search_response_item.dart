class LocationSearchResponseItem {
  int? placeId;
  String? licence;
  String? osmType;
  int? osmId;
  List<String>? boundingbox;
  String lat = "";
  String lon = "";
  String? displayName;
  String? category;
  String? type;
  double? importance;

  LocationSearchResponseItem(
      {this.placeId,
      this.licence,
      this.osmType,
      this.osmId,
      this.boundingbox,
      this.lat = "",
      this.lon = "",
      this.displayName,
      this.category,
      this.type,
      this.importance});

  LocationSearchResponseItem.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    licence = json['licence'];
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    boundingbox = json['boundingbox'].cast<String>();
    lat = json['lat'];
    lon = json['lon'];
    displayName = json['display_name'];
    category = json['category'];
    type = json['type'];
    importance = json['importance'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['place_id'] = placeId;
    data['licence'] = licence;
    data['osm_type'] = osmType;
    data['osm_id'] = osmId;
    data['boundingbox'] = boundingbox;
    data['lat'] = lat;
    data['lon'] = lon;
    data['display_name'] = displayName;
    data['category'] = category;
    data['type'] = type;
    data['importance'] = importance;
    return data;
  }
}
