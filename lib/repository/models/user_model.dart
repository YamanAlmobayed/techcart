class UserModel {
  final int? id;
  final String? email;
  final String? name;
  final String? dateOfBirth;
  final String? photo;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.dateOfBirth,
    this.photo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        dateOfBirth: json['date_of_birth'],
        photo: json["photo"],
      );
}
