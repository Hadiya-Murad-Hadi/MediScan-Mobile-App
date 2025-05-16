// lib/data/models/medication.dart

class Medication {
  final String id;
  final String name;
  final double dose;
  final String unit; // e.g., mg, ml
  final List<String> timings; // List of times to take the medication (e.g., ["08:00", "20:00"])
  final String frequency; // e.g., daily, weekly, monthly, specific days
  final String? notes;
  final DateTime startDate;
  final DateTime? endDate;
  final String userId;
  final String? pillImage; // Path or URL to the pill image
  final List<String> symptomCategories; // Categories this medication might affect

  Medication({
    required this.id,
    required this.name,
    required this.dose,
    required this.unit,
    required this.timings,
    required this.frequency,
    this.notes,
    required this.startDate,
    this.endDate,
    required this.userId,
    this.pillImage,
    this.symptomCategories = const [],
  });

  // Factory method to create a Medication object from a Firestore document
  factory Medication.fromFirestore(Map<String, dynamic> data, String id) {
    return Medication(
      id: id,
      name: data['name'] ?? '',
      dose: (data['dose'] ?? 0.0).toDouble(),
      unit: data['unit'] ?? '',
      timings: List<String>.from(data['timings'] ?? []),
      frequency: data['frequency'] ?? '',
      notes: data['notes'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp?)?.toDate(),
      userId: data['userId'] ?? '',
      pillImage: data['pillImage'],
      symptomCategories: List<String>.from(data['symptomCategories'] ?? []),
    );
  }

  // Method to convert a Medication object to a Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'dose': dose,
      'unit': unit,
      'timings': timings,
      'frequency': frequency,
      'notes': notes,
      'startDate': startDate,
      'endDate': endDate,
      'userId': userId,
      'pillImage': pillImage,
      'symptomCategories': symptomCategories,
    };
  }
}