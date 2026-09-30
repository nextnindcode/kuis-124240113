import 'package:flutter/material.dart';

import '../model/pokemon.dart';
import '../theme/app_theme.dart';
import '../widget/info.dart';
import '../widget/section.dart';

class DetailScreen extends StatefulWidget {
  final Pokemon pokemon;

  const DetailScreen({super.key, required this.pokemon});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;

    return Scaffold(
      backgroundColor: AppColors.krem,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: AppColors.coklatTua,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    pokemon.image,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.hijauSage,
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.coklatTua.withOpacity(0.85),
                        ],
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
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.category_rounded,
                        size: 16,
                        color: AppColors.hijauTua,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        pokemon.types.join(', '),
                        style: const TextStyle(
                          color: AppColors.hijauTua,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: InfoStat(
                          icon: Icons.monitor_weight_outlined,
                          label: 'Berat',
                          value: '${pokemon.weight} kg',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InfoStat(
                          icon: Icons.height_rounded,
                          label: 'Tinggi',
                          value: '${pokemon.height} cm',
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Tipe',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.coklatTua,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    children: pokemon.types
                        .map(
                          (type) => SectionChip(
                            label: type,
                            icon: Icons.terrain_rounded,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Aktivitas Khas',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.coklatTua,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
