import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/sura_model.dart';

class QuranRepository {
  Future<Map<int, Surah>> loadQuran() async {
    final data = await rootBundle.loadString("Assets/quran/quran.json");

    final Map<String, dynamic> jsonMap = json.decode(data);

    Map<int, Surah> result = {};

    jsonMap.forEach((key, value) {
      final surah = Surah.fromJson(key, value);
      result[surah.id] = surah;
    });

    return result;
  }
}