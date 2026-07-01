import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import 'home_screen.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: size.height * .05),

                Text(
                  "Welcome Back",
                  style: GoogleFonts.inter(
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffF9C80E),
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Login",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2B2D42),
                  ),
                ),

                const SizedBox(height: 45),

                CustomTextField(
                  label: "E mail",

                  hint: "Enter your E mail",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: "Password",
                  hint: "Enter your Password",
                  controller: passwordController,
                  obscureText: obscurePassword,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Image.asset(
                        "assets/icons/eye.png",
                        width: 80,
                        height: 24,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password ?",
                      style: GoogleFonts.inter(
                        color: Color(0xffFF8C69),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * .12),

                Consumer<AuthProvider>(
                  builder: (context, auth, child) {
                    return CustomButton(
                      text: "Login",
                      textStyle: GoogleFonts.inter(
                        color: const Color(0xFF2B2D42),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      isLoading: auth.isLoading,
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }

                        final navigator = Navigator.of(context);
                        final messenger = ScaffoldMessenger.of(context);

                        try {
                          await auth.login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );

                          if (!mounted) return;

                          navigator.pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        } catch (e) {
                          if (!mounted) return;

                          messenger.showSnackBar(
                            SnackBar(
                              content: Text(
                                e.toString().replaceFirst("Exception: ", ""),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.inter(color: Color(0xff2B2D42)),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Register",
                        style: GoogleFonts.inter(color: Color(0xffFF7043)),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    const Expanded(child: Divider()),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or Login With",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF2B2D42),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    socialButton("assets/icons/google.png"),

                    const SizedBox(width: 40),

                    socialButton("assets/icons/apple.png"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget socialButton(String asset) {
    return Container(
      height: 58,
      width: 58,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),

        borderRadius: BorderRadius.circular(8),
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Image.asset(asset),
      ),
    );
  }
}
