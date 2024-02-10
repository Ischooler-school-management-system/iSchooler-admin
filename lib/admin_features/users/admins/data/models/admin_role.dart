class AdminRole {
  final int id;
  final String name;

  const AdminRole({
    required this.id,
    required this.name,
  });

  factory AdminRole.empty() {
    return const AdminRole(
      id: 0,
      name: '',
    );
  }

  factory AdminRole.dummy() {
    return const AdminRole(
      id: 1,
      name: 'Administrator',
    );
  }

  factory AdminRole.fromMap(Map<String, dynamic> map) {
    return AdminRole(
      id: map['id'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'AdminRole{id: $id, name: $name}';
  }
}
