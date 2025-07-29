import 'dart:async';

import 'package:agentiq/entities/user.dart';
import 'package:agentiq/firebase_options.dart';
import 'package:agentiq/helpers.dart';
import 'package:agentiq/resources.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AgentiqAuthService {
  /// Returns the current authentication status.
  Future<bool> isAuthenticated();

  /// Authenticates the user with the provided credentials.
  ///
  /// Returns `true` if authentication is successful, otherwise `false`.
  Future<bool> authenticate(String username, String password);

  /// Logs out the current user.
  Future<void> logout();

  /// Retrieves the current user's information.
  Future<AgentiqUser?> getCurrentUser();

  Stream<AgentiqUser?> userAuthStateChanges();
}

class FirebaseAuthService implements AgentiqAuthService {
  late final FirebaseAuth _auth;
  late final GoogleSignIn _googleSignIn;
  AgentiqUser? _currentUser;
  FirebaseAuthService(GoogleSignIn googleSignIn) {
    // Initialize Firebase if not already initialized
    _auth = FirebaseAuth.instance;
    _googleSignIn = googleSignIn;
  }

  Future<void> _signInFirebaseWithGoogleAccount(
    GoogleSignInAccount googleUser,
  ) async {
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      if (idToken == null) {
        logger.e(
          'Google ID Token is null from GoogleSignInAccount. Cannot sign into Firebase.',
        );
        throw Exception('Google ID Token not found. Authentication failed.');
      }

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: idToken,
      );

      await _auth.signInWithCredential(credential);
      logger.i(
        'Firebase sign-in successful with Google credentials via stream.',
      );
    } on FirebaseAuthException catch (e) {
      logger.e(
        'Firebase Auth Error signing in with Google credential: ${e.code} - ${e.message}',
      );
      rethrow;
    } catch (e) {
      logger.e(
        'Unexpected error during Firebase sign-in with Google credential: $e',
      );
      rethrow;
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    if (_auth.currentUser != null) {
      return true; // User is authenticated
    }
    return false;
  }

  @override
  Future<bool> authenticate(String username, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      if (userCredential.user != null) {
        return true; // Authentication successful
      }
    } on FirebaseAuthException catch (e) {
      logger.e(
        'Firebase Auth Error during authentication: ${e.code} - ${e.message}',
      );
      return false;
    } catch (e) {
      logger.e('Unexpected error during authentication: $e');
      return false;
    }
    return false;
  }

  @override
  /*************  ✨ Windsurf Command ⭐  *************/
  /// Logs out the current user.
  ///
  /// This method can be used to explicitly log the user out of the app.
  ///
  /// Returns a `Future` that resolves once the user has been logged out.
  /*******  5c9bd305-be4b-4d5a-a2c0-4f645267a98c  *******/
  Future<void> logout() async {
    await _auth.signOut(); // Logs out the current user
  }

  @override
  Future<AgentiqUser?> getCurrentUser() async {
    if (_currentUser != null) {
      return _currentUser;
    }
    final user = _auth.currentUser;
    if (user != null) {
      return AgentiqUser(
        id: user.uid,
        role: UserRole.user,
        name: user.displayName ?? '',
        email: user.email ?? '',
        phoneNumber: user.phoneNumber ?? '',
        profilePictureUrl: user.photoURL ?? '',
      );
    }
    return null;
  }

  @override
  Stream<AgentiqUser?> userAuthStateChanges() {
    return _auth.authStateChanges().map((user) {
      if (user != null) {
        return AgentiqUser(
          id: user.uid,
          role: UserRole.user,
          name: user.displayName ?? '',
          email: user.email ?? '',
          phoneNumber: user.phoneNumber ?? '',
          profilePictureUrl: user.photoURL ?? '',
        );
      }
      return null;
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser;

      googleUser = await _googleSignIn.authenticate();

      if (googleUser == null) {
        logger.i('Google Sign-In canceled by user.');
        return;
      }

      await _signInFirebaseWithGoogleAccount(googleUser);
      logger.i(
        'Successfully initiated and completed Firebase sign-in with Google.',
      );
    } on FirebaseAuthException catch (e) {
      logger.e(
        'Firebase Auth Error during interactive Google sign-in: ${e.code} - ${e.message}',
      );
      rethrow;
    } on Exception catch (e) {
      logger.e('General error during interactive Google sign-in: $e');
      rethrow;
    }
  }

  Future<Tuple2<bool, String>> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return Tuple2(true, "password_reset_email_sent");
    } catch (e) {
      return Tuple2(false, "something_went_wrong ${e.toString()}");
    }
  }

  Future<Tuple2<bool, String>> createNewUserWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        return Tuple2(true, "");
      } else {
        return Tuple2(false, "something_went_wrong_please_try_again");
      }
    } catch (e) {
      logger.e(e);
      return Tuple2(
        false,
        "something_went_wrong_please_try_again ${e.toString()}",
      );
    }
  }
}
