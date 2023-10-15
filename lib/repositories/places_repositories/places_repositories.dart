import 'dart:convert' as convert;
import 'package:food_delivery_app/model/place_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_app/model/place_autocomplete_model.dart';
import 'package:food_delivery_app/repositories/places_repositories/base_plases_repository.dart';

class PlacesRepository extends BasePlacesRepository {
  String key = "AIzaSyBOqRSSvyPANg9a_4nfL389KxA8HTyZFnU";
  String types = "geocode";

  @override
  Future<List<PlaceAutoComplete>> getAutoComplete(String searchInput) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key");

    var responce = await http.get(url);
    var jsonBody = convert.jsonDecode(responce.body);

    var result = jsonBody["predictions"] as List;

    return result.map((place) => PlaceAutoComplete.fromjson(place)).toList();
  }

  @override
  Future<Place> getPlace(String placeId) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key');
    var responcePlace = await http.get(url);
    var jsonBody = convert.jsonDecode(responcePlace.body);
    var result = jsonBody['result'] as Map<String, dynamic>;

    return Place.fromJson(result);
  }
}
