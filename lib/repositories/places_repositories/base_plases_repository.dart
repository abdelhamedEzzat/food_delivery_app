import 'package:food_delivery_app/model/place_autocomplete_model.dart';
import 'package:food_delivery_app/model/place_model.dart';

abstract class BasePlacesRepository {
  Future<List<PlaceAutoComplete>?> getAutoComplete(String searchInput);

  Future<Place> getPlace(String placeId);
}
