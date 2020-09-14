class Place {
  final String icon;
  final String name;
  final bool openNow;
  final int rating;

  Place({this.icon, this.name, this.openNow, this.rating});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        icon: json["icon"],
        name: json["name"],
        openNow: json["open_now"],
        rating: json["rating"]
    );
  }
}