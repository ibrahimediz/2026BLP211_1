import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

/// PROVIDER ÖRNEĞİ - ANA SAYFA
///
/// Bu sayfa, Provider pattern'inin nasıl kullanıldığını gösterir.
/// ChangeNotifierProvider ile provider'ları sağlıyoruz, Consumer ile dinliyoruz.

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // "MultiProvider ile birden fazla provider sağlayabiliyoruz"
      providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider Örneği'),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // COUNTER BÖLÜMÜ
              _buildSection(
                title: '1. COUNTER ÖRNEĞİ',
                description: 'Provider pattern ile basit bir sayaç uygulaması',
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // "Consumer ile provider'ı dinliyoruz"
                        // "Provider değiştiğinde otomatik olarak rebuild olur"
                        Consumer<CounterProvider>(
                          builder: (context, counterProvider, child) {
                            return Text(
                              'Sayaç: ${counterProvider.count}',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              // "context.read ile provider'a erişip, metodu çağırıyoruz"
                              onPressed: () {
                                context.read<CounterProvider>().decrement();
                              },
                              child: const Text('-'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<CounterProvider>().reset();
                              },
                              child: const Text('Sıfırla'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<CounterProvider>().increment();
                              },
                              child: const Text('+'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
