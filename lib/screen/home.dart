import 'package:flutter/material.dart';

import '../data/pokemon_list.dart';
import '../theme/app_theme.dart';
import '../widget/chip.dart';
import 'detail.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, $username!',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.coklatTua,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${pokemonList.length} Pokemon menantimu untuk dijelajahi',
                style: TextStyle(
                  color: AppColors.hijauTua.withValues(alpha: 0.8),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = pokemonList[index];

              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(pokemon: pokemon),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.putih,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.coklatTua.withValues(alpha: 0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.krem,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.network(
                          pokemon.image,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stack) => const Icon(
                            Icons.image_not_supported,
                            color: AppColors.hijauTua,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pokemon.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.coklatTua,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Wrap: type kedua pindah baris kalau sempit.
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: pokemon.types
                                  .map((t) => TypeChip(label: t))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.info_outline,
                        color: AppColors.orangeTerang,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
