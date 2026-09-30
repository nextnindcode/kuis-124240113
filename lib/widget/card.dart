import 'package:flutter/material.dart';

import '../model/pokemon.dart';
import '../theme/app_theme.dart';
import 'chip.dart';

//satu baris pokemon di halaman Beranda: gambar, nama, types, dan ikon info
class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onTap; //buka halaman detail

  const PokemonCard({super.key, required this.pokemon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 3,
      color: AppColors.putih,
      child: ListTile(
        onTap: onTap, //seluruh baris bisa diklik
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: Image.network(
          pokemon.image,
          width: 56,
          height: 56,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stack) =>
              const Icon(Icons.image_not_supported, size: 40),
        ),
        title: Text(
          pokemon.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Wrap(
            runSpacing: 6,
            children: pokemon.types.map((t) => TypeChip(label: t)).toList(),
          ),
        ),
        trailing: const Icon(Icons.info, color: Colors.black54),
      ),
    );
  }
}
