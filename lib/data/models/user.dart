// lib/data/models/user.dart

class AppUser {
  final String id;
  final String email;
  final String? guardianId;
  final List<String> allergies;
  final List<String> conditions;

  AppUser({
    required this.id,
    required this.email,
    this.guardianId,
    this.allergies = const [],
    this.conditions = const [],
  });

  factory AppUser.fromFirestore(Map<String, dynamic> data, String id) {
    return AppUser(
      id: id,
      email: data['email'] ?? '',
      guardianId: data['guardianId'],
      allergies: List<String>.from(data['allergies'] ?? []),
      conditions: List<String>.from(data['conditions'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'guardianId': guardianId,
      'allergies': allergies,
      'conditions': conditions,
    };
  }
}