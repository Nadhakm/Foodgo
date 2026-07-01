import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.login(
        email: email,
        password: password,
      );

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString("access", response.access);
      await prefs.setString("refresh", response.refresh);
      await prefs.setString("email", response.email);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("access") != null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
