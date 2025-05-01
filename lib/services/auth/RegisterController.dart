import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/auth/Home.dart';

class RegisterController {
  bool isLoading = false; // State for loading
  String email = '';
  String password = '';
  String confirmPassword = '';

  // Register method
  Future<void> register(Function updateUI, BuildContext context) async {
    if (password != confirmPassword) {
      // Show error for password mismatch
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      updateUI(() {}); // Trigger UI update if needed
      return;
    }

    isLoading = true;
    updateUI(() {}); // Trigger UI update to show loading state

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      // Show error message from FirebaseAuthException
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(e.message ?? 'Registration failed'),
            backgroundColor: Colors.red),
      );
    } finally {
      isLoading = false;
      updateUI(() {}); // Trigger UI update to hide loading state
    }
  }
}
