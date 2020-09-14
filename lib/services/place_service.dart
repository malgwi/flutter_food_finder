import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:food_finder/models/place/place_response.dart';
import 'package:food_finder/services/base_place.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class PlaceService extends BasePlace {

  Map<String, String> _headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    "Accept": "application/json"
  };

  @override
  Future<List<Result>> getPlaces({String lat, String long}) async {
    String url = BASE_URL + 'location=$lat,$long&radius=$kRadius&type=$kType&keyword=$kKeyword&key=$apiKey';
    print(url);
    final responsePayload = await http.get(url, headers: _headers);
    String responseUTF8 = utf8.decode(responsePayload.bodyBytes);
    final body = jsonDecode(responseUTF8);
    return PlaceResponse.fromJson(body).results;
  }
}