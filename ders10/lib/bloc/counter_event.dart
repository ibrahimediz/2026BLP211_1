import 'package:equatable/equatable.dart';

/// BLOC ÖRNEĞİ - COUNTER EVENTS
///
/// BLoC (Business Logic Component) pattern'i, event-driven bir yaklaşımdır.
///
/// ÖNEMLİ KAVRAMLAR:
/// - Event: Kullanıcı aksiyonları (buton tıklama, input değişikliği)
/// - State: Uygulamanın mevcut durumu
/// - BLoC: Event'leri State'e dönüştüren mantık katmanı
///
/// AVANTAJLARI:
/// - Test edilebilirlik
/// - Yeniden kullanılabilirlik
/// - Ayrıştırılmış mantık (separation of concerns)

/// Counter için event'ler
/// "Event'ler, kullanıcının yapabileceği aksiyonları temsil eder"
/// "Equatable kullanarak, aynı event'lerin eşit olarak kabul edilmesini sağlıyoruz"
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

/// Sayacı artırma event'i
/// "Her event, BLoC'a ne yapması gerektiğini söyler"
class CounterIncrementEvent extends CounterEvent {
  const CounterIncrementEvent();
}

/// Sayacı azaltma event'i
class CounterDecrementEvent extends CounterEvent {
  const CounterDecrementEvent();
}

/// Sayacı sıfırlama event'i
class CounterResetEvent extends CounterEvent {
  const CounterResetEvent();
}
