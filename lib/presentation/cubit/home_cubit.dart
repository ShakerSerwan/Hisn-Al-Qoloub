import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/dhikr.dart';
import '../../domain/repositories/dhikr_repository.dart';

class HomeCubit extends Cubit<List<Dhikr>> {
  final DhikrRepository repository;

  HomeCubit(this.repository) : super([]);

  void loadDhikr() {
    emit(repository.getAllDhikr());
  }
}