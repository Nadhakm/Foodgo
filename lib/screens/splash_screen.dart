import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _checkLogin() async {
    final authProvider = context.read<AuthProvider>();
    final isLoggedIn = await authProvider.isLoggedIn();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => isLoggedIn ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset("assets/images/splash.png", fit: BoxFit.fill),
          ),

          // Foodgo logo
          Positioned(
            left: 32,
            bottom: 150,
            child: Image.asset("assets/images/foodgo.png", width: 240),
          ),

          // Start Now button
          Positioned(
            right: 65,
            bottom: 72,
            child: GestureDetector(
              onTap: _checkLogin,
              child: Image.asset("assets/icons/start_now.png", width: 180),
            ),
          ),
        ],
      ),
    );
  }
}
