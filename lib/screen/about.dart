import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'login.dart';

class AboutScreen extends StatelessWidget {
  final String username;

  const AboutScreen({super.key, required this.username});

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Keluar akun?'),
        content: const Text('Kamu akan kembali ke halaman login.'),
        actions: [
          TextButton(
            //pop = tutup dialog saja dan tetap di halaman ini
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext); //tutup dialog dulu
              // pushAndRemoveUntil + (route) => false = SEMUA halaman di stack dihapus,
              // lalu diganti LoginScreen. Jadi setelah logout, back gak bisa masuk lagi
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text('Keluar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.krem,
      appBar: AppBar(title: const Text('Tentang')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // kartu header aplikasi
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.hijauTua,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.pets, color: AppColors.krem, size: 32),
                const SizedBox(height: 8),
                const Text(
                  'JejakFauna',
                  style: TextStyle(
                    color: AppColors.krem,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Aplikasi jelajah satwa, dibuat untuk Latihan Kuis Praktikum Pemrograman Mobile.',
                  style: TextStyle(
                    color: AppColors.krem,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Login sebagai: $username',
                  style: TextStyle(
                    color: AppColors.krem.withOpacity(0.85),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun',
                  style: TextStyle(
                    color: AppColors.krem.withOpacity(0.85),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _confirmLogout(context),
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text('Logout', style: TextStyle(color: Colors.red)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
