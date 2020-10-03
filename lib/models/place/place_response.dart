class PlaceResponse {
  String status;
  List<Result> results;

  PlaceResponse({this.status, this.results});

  PlaceResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    if (json['results'] != null) {
      results = new List<Result>();
      json['results'].forEach((v) {
        results.add(new Result.fromJson(v));
      });
    }
  }
}

class Result {
  String icon;
  String name;
  String vicinity;
  String rating;
  bool openingNow;

  Result({this.vicinity, this.icon, this.name, this.rating, this.openingNow});

  Result.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
    vicinity = json['vicinity'];
    rating = json['rating'].toString();
  }
}
