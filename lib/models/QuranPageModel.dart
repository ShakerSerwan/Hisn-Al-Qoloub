// models/quran_page_model.dart
import 'verse_model.dart';

class SurahSegment {
  final int surah;
  final int start;
  final int end;

  SurahSegment({required this.surah, required this.start, required this.end});
}

class QuranPageModel {
  final int pageNumber;
  final List<SurahSegment> segments;
  final Map<int, List<Verse>> versesPerSurah;

  QuranPageModel({
    required this.pageNumber,
    required this.segments,
    required this.versesPerSurah,
  });
}