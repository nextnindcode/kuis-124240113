import 'package:flutter/material.dart';

import '../model/pokemon.dart';
import '../theme/app_theme.dart';
import '../widget/info.dart';
import '../widget/chip.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const DetailScreen({super.key, required this.pokemon});

  Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.coklatTua,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.krem,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.coklatTua,
            title: Text('Detail: ${pokemon.name}'),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: AppColors.orangeTerang.withValues(alpha: 0.25),
                  ),
                  // [UBAH] BoxFit.contain + padding (bukan cover): gambar
                  // official-artwork itu PNG transparan, kalau cover kepotong.
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 72, 24, 24),
                    child: Image.network(
                      pokemon.image,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.hijauTua,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stack) => const Icon(
                        Icons.image_not_supported,
                        color: AppColors.hijauTua,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.coklatTua,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: pokemon.types
                        .map((t) => TypeChip(label: t))
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  // [UBAH] Nilai ditampilkan apa adanya tanpa "kg"/"cm":
                  // satuan lama salah (PokeAPI: desimeter & hektogram) dan
                  // contoh soal menampilkan angka mentah.
                  Row(
                    children: [
                      Expanded(
                        child: InfoStat(
                          icon: Icons.tag_rounded,
                          label: 'ID',
                          value: '${pokemon.id}',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InfoStat(
                          icon: Icons.height_rounded,
                          label: 'Height',
                          value: '${pokemon.height}',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InfoStat(
                          icon: Icons.monitor_weight_outlined,
                          label: 'Weight',
                          value: '${pokemon.weight}',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _title('Ability'),
                  const SizedBox(height: 10),
                  Wrap(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.putih,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.orangeTerang),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.bolt_rounded,
                              size: 16,
                              color: AppColors.orangeTerang,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              pokemon.ability,
                              style: const TextStyle(
                                color: AppColors.orangGelap,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
      // [BARU] Tombol Kembali di bawah layar sesuai contoh soal (10 pts).
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
        ),
      ),
    );
  }
}
