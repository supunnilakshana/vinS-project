class LoggedUserModel {
  final int id;
  final String name;
  final String email;
  final String role;

  LoggedUserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.role});

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "name": this.name,
        "email": this.email,
        "role": this.role
      };

  LoggedUserModel.fromMap(Map<dynamic, dynamic> map)
      : id = map["id"],
        name = map["name"],
        email = map["email"] as String,
        role = map["role"];
}
