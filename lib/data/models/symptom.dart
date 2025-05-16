// lib/data/models/symptom.dart

class Symptom {
  final String id;
  final DateTime timestamp;
  final String mood;
  final int energyLevel;
  final int painLevel;
  final List<String> sideEffects;
  final String userId;

  Symptom({
    required this.id,
    required this.timestamp,
    required this.mood,
    required this.energyLevel,
    required this.painLevel,
    this.sideEffects = const [],
    required this.userId,
  });

  // Add factory methods for Firestore if needed
}