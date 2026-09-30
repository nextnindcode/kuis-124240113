import 'package:flutter/material.dart';

class AppColors {
  static const Color coklatTua = Color.fromARGB(
    255,
    205,
    126,
    7,
  ); //appbar dan judul
  static const Color hijauSage = Color.fromARGB(
    255,
    149,
    44,
    2,
  ); //warna sekunder
  static const Color hijauTua = Color.fromARGB(
    255,
    255,
    208,
    0,
  ); //ikon dan button
  static const Color krem = Color(0xFFFCECD8); //background
  static const Color putih = Color(0xFFFFFFFF); //card
}

final ThemeData findPokemonTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.krem,
  primaryColor: AppColors.coklatTua,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.hijauTua,
    primary: AppColors.coklatTua,
    secondary: AppColors.hijauSage,
    tertiary: AppColors.krem,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.coklatTua,
    foregroundColor: AppColors.krem,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.hijauTua,
      foregroundColor: AppColors.krem,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.putih,
    selectedItemColor: AppColors.coklatTua,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
  ),
);
