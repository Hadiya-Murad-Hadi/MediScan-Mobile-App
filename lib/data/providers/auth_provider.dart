// lib/data/providers/auth_provider.dart

//Instruction: This provider manages the authentication state of the user using the AuthRepository. Use ChangeNotifierProvider in your main.dart to make it accessible throughout the app.

import 'package:flutter/material.dart';
import '../../data/repositories/auth_repository.dart';
import '../../core/errors/error_handler.dart';
import '../models/user.dart';

enum AuthState {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  AuthState _state = AuthState.initial;
  AppUser? _user;
  String? _errorMessage;

  AuthProvider(this._authRepository);

  AuthState get state => _state;
  AppUser? get user => _user;
  String? get errorMessage => _errorMessage;

  Future<void> signUp(BuildContext context, String email, String password) async {
    _state = AuthState.loading;
    notifyListeners();
    final userCredential = await _authRepository.signUpWithEmailAndPassword(email, password);
    if (userCredential?.user != null) {
      final newUser = AppUser(id: userCredential!.user!.uid, email: email);
      await _authRepository.saveUserData(newUser);
      _user = newUser;
      _state = AuthState.authenticated;
      notifyListeners();
    } else {
      _state = AuthState.error;
      _errorMessage = 'Failed to sign up.';
      notifyListeners();
      ErrorHandler.handle(context, _errorMessage!);
    }
  }

  Future<void> signIn(BuildContext context, String email, String password) async {
    _state = AuthState.loading;
    notifyListeners();
    final userCredential = await _authRepository.signInWithEmailAndPassword(email, password);
    if (userCredential?.user != null) {
      _user = await _authRepository.getUserData(userCredential!.user!.uid);
      _state = AuthState.authenticated;
      notifyListeners();
    } else {
      _state = AuthState.error;
      _errorMessage = 'Invalid email or password.';
      notifyListeners();
      ErrorHandler.handle(context, _errorMessage!);
    }
  }

  Future<void> signOut(BuildContext context) async {
    _state = AuthState.loading;
    notifyListeners();
    await _authRepository.signOut();
    _user = null;
    _state = AuthState.unauthenticated;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    final userId = await _authRepository.getCurrentUserId();
    if (userId != null) {
      _user = await _authRepository.getUserData(userId);
      if (_user != null) {
        _state = AuthState.authenticated;
      } else {
        _state = AuthState.unauthenticated;
      }
    } else {
      _state = AuthState.unauthenticated;
    }
    notifyListeners();
  }

  // Implement other auth-related logic (e.g., linking guardian)
}