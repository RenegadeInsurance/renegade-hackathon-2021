import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:we_alert/constants/api_constants.dart';
import 'package:we_alert/modules/home/models/fetchaddresssuggestionmodels/places.dart';
import 'package:we_alert/modules/home/models/fetchaddresssuggestionmodels/suggestions.dart';
import 'base_fetchaddresssuggestion.dart';

//Repository to fetch the address suggestions.
class FetchAddressSuggestion extends BaseFetchAddressSuggestion {
  //make a client provided by http.
  final client = Client();
  //We need session token to make api call for fetching list.
  FetchAddressSuggestion(this.sessionToken);
  //SessionToken is provided by the constructor.
  final String sessionToken;
  //Get the api key from Api Constants class
  static final String androidKey = ApiContants.androidKey;
  static final String iosKey = ApiContants.iosKey;
  //Assign the respective platfrom wise api Key to the variable apikey
  final apiKey = Platform.isAndroid ? androidKey : iosKey;

  //Funcrion to fetch suggestion which return Suggestion which is a user defined class with place id and description.
  @override
  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    //URL to make api call with needed parameters.
    final request =
        '${ApiContants.baseUrlGoogle}autocomplete/json?input=$input&types=address&language=$lang&components=country:np&key=$apiKey&sessiontoken=$sessionToken';
    final response = await client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        // Compose suggestions in a list
        //Return the prediction from google api response as Suggestion.
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        //On zero result found return empty list with no suggestions.
        return [];
      }
      //Exception handling
      throw Exception(result['error_message']);
    } else {
      throw Exception("Failed to fetch suggestion");
    }
  }

  //Function to get the place latitude and longitude from the palce id returned by fetch suggestions
  @override
  Future<PlaceLatLang> getPlaceDetailFromId(String placeId) async {
    //URL to make api call with needed parameters.
    final request =
        '${ApiContants.baseUrlGoogle}details/json?place_id=$placeId&fields=geometry&key=$apiKey';
    //Making api call to get the details
    final response = await client.get(Uri.parse(request));
    if (response.statusCode == 200) {
      //Upon getting valid response decode the body else throw exception.
      final result = await json.decode(response.body);
      if (result['status'] == 'OK') {
        //Return the placelatlong model which includes lat and long.
        return PlaceLatLang(
            lat: result['result']['geometry']['location']['lat'],
            lang: result['result']['geometry']['location']['lng']);
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception("Failed to fetch suggestion");
    }
  }
}
