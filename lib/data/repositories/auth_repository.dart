//Authentication logic
// lib/data/repositories/auth_repository.dart

//Instruction: This repository handles authentication-related operations using the FirebaseService.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/services/firebase_service.dart';
import '../models/user.dart';

class AuthRepository {
  final FirebaseService _firebaseService;

  AuthRepository(this._firebaseService);

  Future<UserCredential?> signUpWithEmailAndPassword(String email, String password) async {
    return _firebaseService.signUpWithEmailAndPassword(email, password);
  }

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    return _firebaseService.signInWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
  }

  Future<String?> getCurrentUserId() async {
    return _firebaseService.getCurrentUserId();
  }

  Future<AppUser?> getUserData(String userId) async {
    try {
      final doc = await _firebaseService.firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return AppUser.fromFirestore(doc.data()!, doc.id);
      }

    } catch(e) {
      throw Exception('Error fetching user data: $e');
    }
    return null;
  }

  Future<void> saveUserData(AppUser user) async {
    await _firebaseService.firestore.collection('users').doc(user.id).set(user.toFirestore());
  }

  // Implement logic for linking guardian and fetching pharmacy data
}