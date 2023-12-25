class UserModel {
  String? id;
  String? username;
  String? email;
  String? displayName;
  DateTime? dateOfBirth;
  String? classId;
  String? phoneNumber;
  String? address;
  bool? paymentStatus;

  // Constructor
  UserModel({
    this.id,
    this.username,
    this.email,
    this.displayName,
    this.dateOfBirth,
    this.classId,
    this.phoneNumber,
    this.address,
    this.paymentStatus,
  });

  // Factory method for creating an empty user
  factory UserModel.empty() {
    return UserModel(
      id: '-1',
      username: null,
      email: null,
      displayName: null,
      dateOfBirth: null,
      classId: null,
      phoneNumber: null,
      address: null,
      paymentStatus: null,
    );
  }

  // Convert UserModel to Map with non-null values
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    // if (id != null) map['id'] = id;
    if (username != null) map['username'] = username;
    if (email != null) map['email'] = email;
    if (displayName != null) map['displayName'] = displayName;
    if (dateOfBirth != null) {
      map['dateOfBirth'] = dateOfBirth!.toIso8601String();
    }
    if (classId != null) map['classId'] = classId;
    if (phoneNumber != null) map['phoneNumber'] = phoneNumber;
    if (address != null) map['address'] = address;
    if (paymentStatus != null) map['paymentStatus'] = paymentStatus;
    return map;
  }

  // Create UserModel from Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      displayName: map['displayName'],
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      classId: map['classId'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      paymentStatus: map['paymentStatus'],
    );
  }
}
