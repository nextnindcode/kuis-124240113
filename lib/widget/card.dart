import 'package:flutter/material.dart';

import '../model/pokemon.dart';
import '../theme/app_theme.dart';

//card hewan buat grid di halaman home dan favorit
//dipisah jadi widget sendiri biar gak nulis kode yang sama dua kali
class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final bool isFavorite;
  final VoidCallback onTap; // buka halaman detail
  final VoidCallback onFavoriteTap; // toggle favorit

  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // seluruh kartu bisa ditekan
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.putih,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.coklatTua.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias, // biar foto ikut kepotong sudut rounded
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              // Stack: numpuk foto + badge tipe + tombol hati
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    pokemon.image,
                    fit: BoxFit.cover,
                    // tampil loading selama foto diunduh
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        color: AppColors.krem,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.hijauTua,
                          ),
                        ),
                      );
                    },
                    // kalau gagal load, tampil ikon
                    errorBuilder: (context, error, stack) => Container(
                      color: AppColors.krem,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: AppColors.hijauTua,
                      ),
                    ),
                  ),
                  // badge tipe di pojok kiri atas
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.coklatTua.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        pokemon.types.join(', '),
                        style: const TextStyle(
                          color: AppColors.krem,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // tombol hati di pojok kanan atas, ikon ganti sesuai isFavorite
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: onFavoriteTap,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.redAccent : AppColors.krem,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
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
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.monitor_weight_outlined,
                        size: 12,
                        color: AppColors.hijauTua,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${pokemon.weight} kg',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.hijauTua,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
