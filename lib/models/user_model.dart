class User{
  final int id;
  final String email;
  final String password;

  User({
    required this.id,
    required this.email,
    required this.password
  });
  factory User.fromMap(Map userMap) {
    return User(
      id: userMap['id'],
      email: userMap['email'],
      password: userMap['password'],
    );
  }
}