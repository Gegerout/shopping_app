class CredsModel {
  final String email;
  final String password;

  CredsModel(this.email, this.password);

  factory CredsModel.fromJson(Map<String, dynamic> json) {
    return CredsModel(json["email"], json["password"]);
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password
  };
}