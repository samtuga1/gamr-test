import 'package:get/get.dart';

class Validators {
  const Validators._();

  static String? validateEmpty(String? v) {
    if (v!.isEmpty) {
      return 'Field cannot be empty';
    } else {
      return null;
    }
  }

  static String? validateEmail(String? v) {
    if (v!.trim().isEmpty) {
      return 'Email cannot be empty';
    } else if (!GetUtils.isEmail(v.trim())) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? v) {
    if (v!.isEmpty) {
      return 'Password cannot be empty';
    } else if (v.length < 8) {
      return 'Please enter valid password';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? v, String password) {
    if (v!.isEmpty || password.isEmpty) {
      return 'Password cannot be empty';
    } else if (v.length < 8 || password.length < 8 || v != password) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }
}
