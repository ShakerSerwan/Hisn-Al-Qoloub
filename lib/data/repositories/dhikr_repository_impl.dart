import 'package:flutter/material.dart';
import '../../domain/entities/dhikr.dart';
import '../../domain/repositories/dhikr_repository.dart';

class DhikrRepositoryImpl implements DhikrRepository {
  @override
  List<Dhikr> getAllDhikr() {
    return [
      Dhikr(title: "أذكار الصباح", icon: Icons.wb_sunny, color: Colors.orange),
      Dhikr(title: "أذكار المساء", icon: Icons.nightlight, color: Colors.purple),
      Dhikr(title: "أذكار النوم", icon: Icons.bedtime, color: Colors.grey),
    ];
  }
}