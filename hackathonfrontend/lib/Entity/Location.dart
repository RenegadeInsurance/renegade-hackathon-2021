class Location {
  final int locationID;
  final String country;
  final String state;
  final String city;

  Location(this.locationID, this.country, this.state, this.city);

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      json["locationID"],
      json["country"],
      json["state"],
      json["city"],
    );
  }
}
