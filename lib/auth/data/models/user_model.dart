class UserModel {
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  UserModel(this.username, this.email, this.firstName, this.lastName,
      this.gender, this.image, this.token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(json["username"], json["email"], json["firstName"],
        json["lastName"], json["gender"], json["image"], json["token"]);
  }

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "image": image,
    "token": token
  };
}
