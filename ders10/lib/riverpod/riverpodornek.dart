import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hafta10/riverpod/counter_provider.dart';

class Riverpodexample extends ConsumerWidget {
  const Riverpodexample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Sayaç: $counter',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => decrementCounter(ref),
                    child: const Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () => resetCounter(ref),
                    child: const Text('Sıfırla'),
                  ),
                  ElevatedButton(
                    onPressed: () => incrementCounter(ref),
                    child: const Text('+'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
