import 'package:flutter/material.dart';
import 'reader_screen.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("القرآن الكريم"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("ابدأ القراءة"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ReaderScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}