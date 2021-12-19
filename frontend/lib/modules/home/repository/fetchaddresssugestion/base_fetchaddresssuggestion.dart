import 'package:we_alert/modules/home/models/fetchaddresssuggestionmodels/places.dart';
import 'package:we_alert/modules/home/models/fetchaddresssuggestionmodels/suggestions.dart';

//Base class for fetching address suggestion.
//Provides definition for FetchAddressSuggestion repositiory.
abstract class BaseFetchAddressSuggestion {
  //Function to get the place details form place id
  //Place Id will be returned by fetch suggestion function
  //We are using google map platfrom for this
  Future<PlaceLatLang?> getPlaceDetailFromId(String placeId) async {}
  //Function to fetch suggestion.
  //This function returns List of Suggestion which is user defined class containing place id and description.
  Future<List<Suggestion?>?> fetchSuggestions(
      String input, String lang) async {}
}
