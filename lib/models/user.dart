class User {
  final int id;
  final String name;
  final String email;
  final String imagePath;
  final String token;
  int addressId;
  String? loginProvider;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.imagePath,
    required this.token,
    required this.addressId,
    this.loginProvider,
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
