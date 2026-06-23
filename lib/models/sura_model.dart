import 'verse_model.dart';

class Surah {
  final int id;
  final List<Verse> verses;

  Surah({
    required this.id,
    required this.verses,
  });

  factory Surah.fromJson(String id, List<dynamic> jsonList) {
    return Surah(
      id: int.parse(id),
      verses: jsonList.map((e) => Verse.fromJson(e)).toList(),
    );
  }
}