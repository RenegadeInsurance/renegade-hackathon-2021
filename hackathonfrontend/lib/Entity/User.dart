class User {
  final int userID;
  final int locationID;
  final String name;
  final String email;
  final int age;
  final String gender;
  final bool deactivated;

  User(this.userID, this.locationID, this.name, this.email, this.age, this.gender, this.deactivated);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["userID"],
      json["locationID"],
      json["name"],
      json["email"],
      json["age"],
      json["gender"],
      json["deactivated"] == 0 ? false : true,
    );
  }
}
