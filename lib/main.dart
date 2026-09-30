import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'screen/login.dart';

void main() {
  runApp(const FindPokemonApp());
}

class FindPokemonApp extends StatelessWidget {
  const FindPokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Pokemon',
      debugShowCheckedModeBanner: false,
      theme: findPokemonTheme,
      home: const LoginScreen(),
    );
  }
}
