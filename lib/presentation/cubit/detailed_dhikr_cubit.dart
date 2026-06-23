import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/detailed_dhikr.dart';
import '../../domain/repositories/detailed_dhikr_repository.dart';

class DetailedDhikrState {
  final List<DetailedDhikr> dhikrList;
  final int currentIndex;
  final int counter;

  DetailedDhikrState({
    required this.dhikrList,
    this.currentIndex = 0,
    this.counter = 0,
  });

  DetailedDhikrState copyWith({
    List<DetailedDhikr>? dhikrList,
    int? currentIndex,
    int? counter,
  }) {
    return DetailedDhikrState(
      dhikrList: dhikrList ?? this.dhikrList,
      currentIndex: currentIndex ?? this.currentIndex,
      counter: counter ?? this.counter,
    );
  }
}

class DetailedDhikrCubit extends Cubit<DetailedDhikrState> {
  final DetailedDhikrRepository repository;

  DetailedDhikrCubit(this.repository)
      : super(DetailedDhikrState(dhikrList: repository.getDhikr()));

  void incrementCounter() {
    final stateData = state;
    int newCounter = stateData.counter + 1;
    int newIndex = stateData.currentIndex;
    final currentDhikr = stateData.dhikrList[stateData.currentIndex];

    if (newCounter >= currentDhikr.repeat) {
      newCounter = 0;
      if (newIndex < stateData.dhikrList.length - 1) {
        newIndex++;
      }
    }

    emit(state.copyWith(currentIndex: newIndex, counter: newCounter));
  }
}