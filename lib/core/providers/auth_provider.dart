import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  AppUser? _currentUser;
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  late final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '411192770586-d8l1j6sr7sft7tcbij7g17uif0ikmi0s.apps.googleusercontent.com',
    scopes: ['email', 'profile'],
  );

  AppUser? get currentUser => _currentUser;

  Future<void> init() async {
    // Listen to auth state changes
    _auth.authStateChanges().listen((firebase_auth.User? firebaseUser) {
      if (firebaseUser != null) {
        _currentUser = AppUser(
          name: firebaseUser.displayName ?? 'USER',
          email: firebaseUser.email ?? '',
          profileImageUrl: firebaseUser.photoURL ?? 'lib/assets/logo tel.png',
        );
      } else {
        _currentUser = null;
      }
      notifyListeners();
    });
  }

  Future<String?> signInWithGoogle() async {
    try {
      // First try to sign in silently (for existing sessions)
      GoogleSignInAccount? googleUser = await _googleSignIn.signInSilently();
      if (googleUser == null) {
        // If no existing session, show sign-in prompt
        googleUser = await _googleSignIn.signIn();
      }

      if (googleUser == null) {
        return 'Login dibatalkan oleh pengguna';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final firebase_auth.AuthCredential credential =
          firebase_auth.GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

      await _auth.signInWithCredential(credential);
      return null; // Success
    } catch (e) {
      print('Google Sign-In error: $e');
      String errorMessage = e.toString().toLowerCase();

      if (errorMessage.contains('popup') || errorMessage.contains('closed')) {
        return 'Popup login diblokir atau ditutup. Izinkan popup di browser Anda.';
      } else if (errorMessage.contains('network') ||
          errorMessage.contains('timeout')) {
        return 'Kesalahan jaringan. Periksa koneksi internet Anda.';
      } else if (errorMessage.contains('configuration') ||
          errorMessage.contains('client')) {
        return 'Konfigurasi Google Sign-In salah. Periksa Client ID dan People API.';
      } else if (errorMessage.contains('people') ||
          errorMessage.contains('403')) {
        return 'People API tidak diaktifkan. Aktifkan di Google Cloud Console.';
      } else if (errorMessage.contains('deprecated')) {
        return 'Versi Google Sign-In perlu diperbarui. Jalankan flutter pub upgrade.';
      } else {
        return 'Login gagal: ${e.toString()}';
      }
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
