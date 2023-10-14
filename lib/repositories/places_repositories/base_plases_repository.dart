import 'package:food_delivery_app/model/place_autocomplete_model.dart';

abstract class BasePlacesRepository {
  Future<List<PlaceAutoComplete>?> getAutoComplete(String searchInput);
}
