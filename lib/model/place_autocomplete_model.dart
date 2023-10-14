class PlaceAutoComplete {
  final String description;
  final String placesID;

  PlaceAutoComplete({required this.description, required this.placesID});

  factory PlaceAutoComplete.fromjson(Map<String, dynamic> json) {
    return PlaceAutoComplete(
        description: json['description'], placesID: json['place_id']);
  }
}
