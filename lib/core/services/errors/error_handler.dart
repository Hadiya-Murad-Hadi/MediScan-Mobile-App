// lib/core/errors/error_handler.dart

import 'package:flutter/material.dart';
import 'app_errors.dart';

class ErrorHandler {
  static void handle(BuildContext context, dynamic error) {
    if (error is AppError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } else {
      // Log the error for debugging
      print('Unhandled Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred.')),
      );
    }
  }
}