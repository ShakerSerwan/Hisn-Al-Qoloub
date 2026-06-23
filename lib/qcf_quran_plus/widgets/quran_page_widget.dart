import 'package:flutter/material.dart';

class QuranPageWidget extends StatelessWidget {
  final int pageNumber;
  final String surahName;
  final int juzNumber;

  const QuranPageWidget({
    super.key,
    required this.pageNumber,
    required this.surahName,
    required this.juzNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // محتوى الصفحة نفسه من PageviewQuran (هو بيغطي الشاشة)
        const SizedBox.shrink(),

        // الرقم أسفل
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Center(
            child: Text("صفحة $pageNumber",
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}