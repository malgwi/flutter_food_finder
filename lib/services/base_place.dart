import 'package:food_finder/models/models.dart';

abstract class BasePlace {
  Future<List<Result>> getPlaces({String lat, String long});
}