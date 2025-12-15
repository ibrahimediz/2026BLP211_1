import 'package:flutter/foundation.dart';

/// PROVIDER ÖRNEĞİ - COUNTER
///
/// Provider, Google'ın önerdiği basit ve etkili bir state management çözümüdür.
///
/// ÖNEMLİ ÖZELLİKLER:
/// - Basit ve anlaşılır
/// - Küçük projeler için ideal
/// - ChangeNotifier pattern kullanır
///
/// NASIL ÇALIŞIR:
/// - ChangeNotifier, state değişikliklerini dinleyenlere bildirim gönderir
/// - notifyListeners() çağrıldığında, dinleyenler güncellenir

/// Counter state'ini yöneten ChangeNotifier
/// "ChangeNotifier, state değişikliklerini dinleyenlere bildirim gönderir"
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  /// Mevcut sayacın değeri
  /// "Getter ile state'e dışarıdan erişim sağlıyoruz"
  int get count => _count;

  /// Sayacı artırma
  /// "notifyListeners() çağrıldığında, tüm dinleyenler güncellenir"
  void increment() {
    _count++;
    // "Bu çağrı, Provider'ı dinleyen tüm widget'ları günceller"
    notifyListeners();
  }

  /// Sayacı azaltma
  void decrement() {
    _count--;
    notifyListeners();
  }

  /// Sayacı sıfırlama
  void reset() {
    _count = 0;
    notifyListeners();
  }
}
