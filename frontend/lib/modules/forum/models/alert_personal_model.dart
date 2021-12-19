class AlertPersonnelModel {
  final String name;
  final String contact;
  final String email;
  AlertPersonnelModel({
    required this.name,
    required this.contact,
    required this.email,
  });

  AlertPersonnelModel copyWith({
    String? name,
    String? contact,
    String? email,
  }) {
    return AlertPersonnelModel(
      name: name ?? this.name,
      contact: contact ?? this.contact,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlertPersonnelModel &&
        other.name == name &&
        other.contact == contact &&
        other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ contact.hashCode ^ email.hashCode;
}
