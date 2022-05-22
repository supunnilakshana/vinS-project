class RegiUserModel {
  final String name;
  final String email;
  final String password;
  final String conpassword;
  final String role;

  RegiUserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.conpassword,
      required this.role});

  Map<String, dynamic> toMap() => {
        "name": this.name,
        "email": this.email,
        "password": this.password,
        "password_confirmation": this.conpassword,
        "role": this.role
      };

  RegiUserModel.fromMap(Map<dynamic, dynamic> map)
      : name = map["name"],
        email = map["email"] as String,
        password = map["password"],
        conpassword = map["password_confirmation"],
        role = map["role"];
}
