class Place {
  final String icon;
  final String name;
  final String vicinity;
  final bool openNow;
  final int rating;

  Place({this.vicinity, this.icon, this.name, this.openNow, this.rating});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      icon: json["icon"],
      name: json["name"],
      vicinity: json["vicinity"],
      openNow: json["open_now"],
      rating: json["rating"],
    );
  }
}
