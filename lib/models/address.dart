class Address {
  final int id;
  final int userId;
  final String? city;
  final String? village;
  final String? phone;
  final String? mobile;
  final String? address;
  final String? building;
  bool isDefault;
  bool deletable = false;

  Address({required this.id, required this.userId, this.city, this.village, this.phone, this.mobile, this.address, this.building, required this.isDefault, required this.deletable});

  // Convert a Address into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {'id': id, 'userId': userId, 'city': city, 'village': village, 'phone': phone, 'mobile': mobile, 'address': address, 'isDefault': isDefault};
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Address{id: $id, userId: $userId, city: $city, village: $village, phone: $phone, mobile: $mobile, address: $address, isDefault: $isDefault}';
  }
}
