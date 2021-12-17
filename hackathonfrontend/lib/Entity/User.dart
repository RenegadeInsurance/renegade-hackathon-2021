class User {
  final int userID;
  final int locationID;
  final double riskFactor;
  final String name;
  final String email;
  final String password;
  final int age;
  final String gender;
  final bool deactivated;

  User(this.userID, this.locationID, this.riskFactor, this.name, this.email,
      this.password, this.age, this.gender, this.deactivated);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["userID"],
      json["locationID"],
      json["riskFactor"],
      json["name"],
      json["email"],
      json["password"],
      json["age"],
      json["gender"],
      json["deactivated"] == 0 ? false : true,
    );
  }
}
