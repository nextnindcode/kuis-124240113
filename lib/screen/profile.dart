import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'login.dart';

const String _maleImage =
    'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png';
const String _femaleImage =
    'https://archives.bulbagarden.net/media/upload/c/cd/Sword_Shield_Gloria.png';

class ProfileScreen extends StatefulWidget {
  final String username;

  const ProfileScreen({super.key, required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _profileImage = _maleImage;

  Widget _circleImage(String url, double size, {Color? borderColor}) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.08),
      decoration: BoxDecoration(
        color: AppColors.krem,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? AppColors.hijauSage,
          width: borderColor == null ? 1 : 3,
        ),
      ),
      child: ClipOval(
        child: Image.network(
          url,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stack) =>
              const Icon(Icons.person, color: AppColors.hijauTua),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.putih,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.hijauSage.withValues(alpha: 0.4),
            ),
          ),
          child: Column(
            children: [
              _circleImage(_profileImage, 140),
              const SizedBox(height: 12),
              Text(
                widget.username,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.coklatTua,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _profileImage = _maleImage),
                    child: _circleImage(
                      _maleImage,
                      56,
                      borderColor: _profileImage == _maleImage
                          ? AppColors.orangeTerang
                          : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () => setState(() => _profileImage = _femaleImage),
                    child: _circleImage(
                      _femaleImage,
                      56,
                      borderColor: _profileImage == _femaleImage
                          ? AppColors.orangeTerang
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.hijauTua,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.krem, fontSize: 13, height: 1.4),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            ),
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
      ],
    );
  }
}
