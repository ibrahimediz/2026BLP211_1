import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

/// BLOC ÖRNEĞİ - COUNTER BLOC
///
/// BLoC, event'leri alıp state'lere dönüştüren mantık katmanıdır.
/// "on<EventType> ile belirli event'leri dinleyip, emit ile yeni state oluşturuyoruz"

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  /// Başlangıç state'i
  /// "super ile başlangıç state'ini belirliyoruz"
  CounterBloc() : super(const CounterState(count: 0)) {
    // "on<EventType> ile event handler'ları tanımlıyoruz"

    /// Artırma event'i
    on<CounterIncrementEvent>((event, emit) {
      // "emit ile yeni state oluşturuyoruz"
      // "Mevcut state'i alıp, count'u artırarak yeni state oluşturuyoruz"
      emit(state.copyWith(count: state.count + 1));
    });

    /// Azaltma event'i
    on<CounterDecrementEvent>((event, emit) {
      emit(state.copyWith(count: state.count - 1));
    });

    /// Sıfırlama event'i
    on<CounterResetEvent>((event, emit) {
      emit(state.copyWith(count: 0));
    });
  }
}
