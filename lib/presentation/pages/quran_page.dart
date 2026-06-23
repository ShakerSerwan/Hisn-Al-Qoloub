import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';
import '../../models/sura_model.dart';
import '../../models/verse_model.dart';
import '../../repositories/quran_repository.dart';
import '../../quran/PageData.dart';
import '../../quran/surah_names.dart';

class QuranPage extends StatefulWidget {
  final int initialPage;

  const QuranPage({super.key, this.initialPage = 1});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  late PageController controller;
  Map<int, Surah> quran = {};
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialPage - 1);
    loadQuran();
  }

  Future<void> loadQuran() async {
    final repo = QuranRepository();
    final data = await repo.loadQuran();

    setState(() {
      quran = data;
      isLoaded = true;
    });
  }

  String getFontFamily(int pageNumber) {
    if (pageNumber < 10) return "QCF_P00$pageNumber";
    if (pageNumber < 100) return "QCF_P0$pageNumber";
    return "QCF_P$pageNumber";
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      //appBar: AppBar(title: const Text("القرآن الكريم")),
      body: PageView.builder(
        controller: controller,
        itemCount: pageData.length,
        itemBuilder: (context, index) {
          return buildPage(index + 1);
        },
      ),
    );
  }

  Widget buildPage(int pageNumber) {
    final page = pageData[pageNumber - 1];

    List<InlineSpan> spans = [];

    for (var seg in page) {
      final surah = quran[seg['surah']]!;
      final verses = surah.verses;

      int start = seg['start']!;
      int end = seg['end']!;

      // اسم السورة
      //spans.add(
        //TextSpan(
          //text: "\n${surahNames[surah.id - 1]}\n",
          //style: const TextStyle(fontSize: 26),
        //),
      //);

      // البسملة
      if (start == 1 && verses.first.bismillah != null) {
        spans.add(TextSpan(text: "${verses.first.bismillah} "));
      }

      for (int i = start - 1; i < end; i++) {
        final v = verses[i];

        spans.add(
          TextSpan(
            text: "${v.text} ﴿${v.index}﴾ ",
          ),
        );
      }
    }

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: RichText(

                textDirection: TextDirection.rtl,
                textAlign: TextAlign.justify,
                text: TextSpan(


                  style: TextStyle(
                    fontSize: 20,
                    height: 2.2,
                    fontWeight: FontWeight.bold,
                    fontFamily: "uthmani_Quran",
                    color: Colors.black,
                  ),
                  children: spans,
                ),
              ),
            ),
          ),
          Text("صفحة $pageNumber"),
        ],
      ),
    );
  }
}