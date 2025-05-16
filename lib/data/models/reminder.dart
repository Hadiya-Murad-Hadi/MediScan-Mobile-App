// lib/data/models/reminder.dart

class Reminder {
  final String id;
  final String medicationId;
  final DateTime scheduledTime;
  final bool isTaken;
  final DateTime? takenTime;

  Reminder({
    required this.id,
    required this.medicationId,
    required this.scheduledTime,
    this.isTaken = false,
    this.takenTime,
  });

  // Add factory methods for Firestore if needed
}

  // Method to convert a Reminder object to a Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'medicationId': medicationId,
      'scheduledTime': scheduledTime,
      'isTaken': isTaken,
      'takenTime': takenTime,
    };
  }

  // Factory method to create a Reminder object from a Firestore document
  Reminder.fromFirestore(Map<String, dynamic> data, String id) {
    return Reminder(
      id: id,
      medicationId: data['medicationId'] ?? '',
      scheduledTime: (data['scheduledTime'] as Timestamp).toDate(),
      isTaken: data['isTaken'] ?? false,
      takenTime: (data['takenTime'] as Timestamp?)?.toDate(),
    );
  }
}