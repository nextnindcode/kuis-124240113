import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'root.dart';

const String _nim = '124240113';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoginFailed = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final messenger = ScaffoldMessenger.of(context);

    if (username.isNotEmpty && password == _nim) {
      messenger.showSnackBar(
        SnackBar(
          content: Text('Login berhasil! Selamat datang, $username'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RootScreen(username: username)),
      );
    } else {
      setState(() => _isLoginFailed = true);
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Login gagal: username kosong atau password salah'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  InputDecoration _fieldDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: AppColors.putih,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _isLoginFailed ? Colors.red : AppColors.hijauSage,
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.coklatTua,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        color: AppColors.orangeTerang,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 96,
                      height: 96,
                      decoration: const BoxDecoration(
                        color: AppColors.krem,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.catching_pokemon,
                        size: 50,
                        color: AppColors.coklatTua,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'FindPokemon',
                  style: TextStyle(
                    color: AppColors.krem,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Masuk dulu untuk melihat koleksi Pokemon anda!',
                  style: TextStyle(
                    color: AppColors.krem.withValues(alpha: 0.85),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.krem,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _usernameController,
                        decoration: _fieldDecoration(
                          'Username',
                          Icons.person_outline,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: _fieldDecoration(
                          'Password',
                          Icons.lock_outline,
                        ),
                      ),
                      if (_isLoginFailed)
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Username atau password salah',
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
