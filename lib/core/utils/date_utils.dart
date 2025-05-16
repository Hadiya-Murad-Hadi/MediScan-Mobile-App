// lib/core/utils/date_utils.dart

//Instruction: Add the intl package to your pubspec.yaml.
// Implement the getNextOccurrence logic based on the medication frequency.

import 'package:intl/intl.dart';

class DateUtils {
  static String formatDate(DateTime? date, String pattern) {
    if (date == null) return '';
    final formatter = DateFormat(pattern);
    return formatter.format(date);
  }

  static DateTime? parseDate(String? dateString, String pattern) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateFormat(pattern).parse(dateString);
    } catch (e) {
      print('Error parsing date: $e');
      return null;
    }
  }

  static DateTime getNextOccurrence(DateTime dateTime, String frequency) {
    // Implement logic to calculate the next occurrence based on frequency (daily, weekly, etc.)
    return dateTime.add(const Duration(days: 1)); // Placeholder
  }

  // Add other date/time utility functions
}