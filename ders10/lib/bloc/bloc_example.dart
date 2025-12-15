import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

/// BLOC ÖRNEĞİ - ANA SAYFA
///
/// Bu sayfa, BLoC pattern'inin nasıl kullanıldığını gösterir.
/// BlocProvider ile BLoC'ları sağlıyoruz, BlocBuilder ile dinliyoruz.

class BlocExample extends StatelessWidget {
  const BlocExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // "MultiBlocProvider ile birden fazla BLoC sağlayabiliyoruz"
      providers: [BlocProvider(create: (_) => CounterBloc())],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BLoC Örneği'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // COUNTER BÖLÜMÜ
              _buildSection(
                title: '1. COUNTER ÖRNEĞİ',
                description: 'BLoC pattern ile basit bir sayaç uygulaması',
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // "BlocBuilder ile BLoC'u dinliyoruz"
                        // "state değiştiğinde otomatik olarak rebuild olur"
                        BlocBuilder<CounterBloc, CounterState>(
                          builder: (context, state) {
                            return Text(
                              'Sayaç: ${state.count}',
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
                              // "context.read ile BLoC'a erişip, event gönderiyoruz"
                              onPressed: () {
                                context.read<CounterBloc>().add(
                                  const CounterDecrementEvent(),
                                );
                              },
                              child: const Text('-'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<CounterBloc>().add(
                                  const CounterResetEvent(),
                                );
                              },
                              child: const Text('Sıfırla'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<CounterBloc>().add(
                                  const CounterIncrementEvent(),
                                );
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

              // TODO LIST BÖLÜMÜ
              _buildSection(
                title: '2. TODO LİST ÖRNEĞİ',
                description: 'BLoC pattern ile todo listesi yönetimi',
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Todo ekleme alanı
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Yeni Todo',
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (value) {
                            // "Event göndererek BLoC'a işlem yaptırıyoruz"
                            context.read<TodoBloc>().add(TodoAddEvent(value));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Todo listesi
                        BlocBuilder<TodoBloc, TodoState>(
                          builder: (context, state) {
                            if (state.todos.isEmpty) {
                              return const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  'Henüz todo yok. Yukarıdan ekleyebilirsiniz.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              );
                            }

                            return Column(
                              children: [
                                ...state.todos.map(
                                  (todo) => ListTile(
                                    title: Text(
                                      todo.title,
                                      style: TextStyle(
                                        decoration: todo.isCompleted
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    ),
                                    leading: Checkbox(
                                      value: todo.isCompleted,
                                      onChanged: (_) {
                                        context.read<TodoBloc>().add(
                                          TodoToggleEvent(todo.id),
                                        );
                                      },
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        context.read<TodoBloc>().add(
                                          TodoDeleteEvent(todo.id),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<TodoBloc>().add(
                                      const TodoClearAllEvent(),
                                    );
                                  },
                                  child: const Text('Tümünü Temizle'),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
