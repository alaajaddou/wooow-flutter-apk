class User {
  final int id;
  final int addressId;
  final String name;
  final String email;
  final String imagePath;
  final String loginProvider;
  final String token;

  User({
    required this.id,
    required this.addressId,
    required this.name,
    required this.email,
    required this.imagePath,
    required this.loginProvider,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'addressId': addressId,
      'name': name,
      'email': email,
      'imagePath': imagePath,
      'loginProvider': loginProvider,
      'token': token,
    };
  }
  @override
  String toString() {
    return 'User(id: $id, addressId: $addressId, name: $name, email: $email, imagePath: $imagePath, loginProvider: $loginProvider, token: $token)';
  }
}