import 'package:equatable/equatable.dart';

/// BLOC ÖRNEĞİ - COUNTER STATE
///
/// State'ler, uygulamanın mevcut durumunu temsil eder.
/// Her state değişikliği, UI'ın yeniden çizilmesine neden olur.

/// Counter state'i
/// "Equatable, state karşılaştırmalarını kolaylaştırır"
/// "Aynı değerlere sahip state'ler eşit kabul edilir, gereksiz rebuild'ler önlenir"
class CounterState extends Equatable {
  final int count;

  const CounterState({this.count = 0});

  /// Yeni state oluşturma
  /// "Immutable state pattern - her değişiklikte yeni state oluşturulur"
  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }

  @override
  List<Object> get props => [count];
}
