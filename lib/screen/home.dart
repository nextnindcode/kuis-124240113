import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _types = const [
    'Semua',
    'Normal',
    'Fire',
    'Water',
    'Grass',
    'Electric',
    'Ground',
    'Ice',
    'Fighting',
    'Poison',
    'Flying',
    'Psychic',
    'Bug',
    'Rock',
    'Ghost',
    'Dragon',
  ];

  String _selectedType = 'Semua';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.krem,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, ${widget.username}!',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.coklatTua,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _types.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final type = _types[index];
                  final isSelected = _selectedType == type;

                  return ChoiceChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        _selectedType = type;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: AppColors.coklatTua.withOpacity(0.15),
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.coklatTua : Colors.black87,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: AppColors.coklatTua.withOpacity(0.3),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
