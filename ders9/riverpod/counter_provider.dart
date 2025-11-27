import 'package:flutter_riverpod/flutter_riverpod.dart';

/// RIVERPOD ÖRNEĞİ - COUNTER
///
/// Riverpod, Flutter'ın en modern state management çözümlerinden biridir.
/// Provider'ın geliştirilmiş versiyonu olarak düşünebiliriz.
///
/// ÖNEMLİ ÖZELLİKLER:
/// - Compile-time güvenlik (hata yakalama)
/// - Test edilebilirlik
/// - Dependency injection
/// - Auto-dispose (otomatik temizlik)

/// Counter state'i tutan provider
/// "Bu provider, basit bir sayacın değerini tutuyor"
/// "StateProvider, basit değerler için kullanılır - karmaşık state'ler için StateNotifier kullanılır"
final counterProvider = StateProvider<int>((ref) {
  // Başlangıç değeri 0
  // "ref parametresi, diğer provider'lara erişim sağlar"
  return 0;
});

/// Counter'ı artıran fonksiyon
/// "Bu fonksiyon, provider'ın state'ini güncelliyor"
void incrementCounter(WidgetRef ref) {
  // "ref.read ile provider'ın mevcut değerini okuyup, yeni değer atıyoruz"
  ref.read(counterProvider.notifier).state++;
}

/// Counter'ı azaltan fonksiyon
void decrementCounter(WidgetRef ref) {
  ref.read(counterProvider.notifier).state--;
}

/// Counter'ı sıfırlayan fonksiyon
void resetCounter(WidgetRef ref) {
  ref.read(counterProvider.notifier).state = 0;
}
