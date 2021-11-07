class Address {
  final int id;
  final int userId;
  final String city;
  final String village;
  final String phone;
  final String mobile;
  final String address;
  final String building;

  Address(
      {required this.id,
      required this.userId,
      required this.city,
      required this.village,
      required this.phone,
      required this.mobile,
      required this.address,
      required this.building});

  // Convert a Address into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {'id': id, 'userId': userId, 'city': city, 'village': village, 'phone': phone, 'mobile': mobile, 'address': address};
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Address{id: $id, userId: $userId, city: $city, village: $village, phone: $phone, mobile: $mobile, address: $address}';
  }
}