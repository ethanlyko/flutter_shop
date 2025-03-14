class UserModel {
  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;
  final DateTime creationAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });
}
