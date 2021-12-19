class PersonalCity {
  final int personalCountriesID;
  final int userID;
  final String country;
  final String state;
  final String city;

  PersonalCity(this.personalCountriesID, this.userID,
      this.country, this.state, this.city);

  factory PersonalCity.fromJson(Map<String, dynamic> json) {
    return PersonalCity(
      json["personalCityID"],
      json["userID"],
      json["country"],
      json["state"],
      json["city"],
    );
  }
}