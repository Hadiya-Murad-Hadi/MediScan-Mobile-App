// lib/core/errors/app_errors.dart

class AppError implements Exception {
  final String message;

  AppError(this.message);

  @override
  String toString() {
    return 'AppError: $message';
  }
}

class AuthError extends AppError {
  AuthError(super.message);
}

class FirebaseError extends AppError {
  FirebaseError(super.message);
}

class NetworkError extends AppError {
  NetworkError(super.message);
}

// Define other specific error types