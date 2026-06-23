import '../../domain/entities/detailed_dhikr.dart';
import '../../domain/repositories/detailed_dhikr_repository.dart';

class EveningDhikrRepositoryImpl implements DetailedDhikrRepository {
  @override
  List<DetailedDhikr> getDhikr() {
    return [
      DetailedDhikr(
        text: "اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ...",
        source: "رواه...",
        repeat: 1,
        hasBasmala: true, // 🔥 هون
      ),
      // أضف كل الأذكار هنا
    ];
  }
}