import 'package:flutter/material.dart';
import '../models/sura_model.dart';

class QuranViewPage extends StatelessWidget {
  final int pageNumber;
  final List<Surah> quran;

  const QuranViewPage({
    super.key,
    required this.pageNumber,
    required this.quran,
  });

  @override
  Widget build(BuildContext context) {
    final surah = quran[0]; // مؤقتاً أول سورة

    return Scaffold(
      appBar: AppBar(
        title: Text("سورة ${surah.id}"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...surah.verses.map((ayah) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                ayah.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  height: 2, // مهم لمنع التداخل
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}