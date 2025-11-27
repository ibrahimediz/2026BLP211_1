import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hafta9/riverpod/riverpodornek.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AnaSayfa());
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // 4 farklı state management yaklaşımı
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter State Management Örnekleri'),
          bottom: const TabBar(
            // "TabBar ile farklı yaklaşımlar arasında geçiş yapabiliyoruz"
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.water_drop), text: 'Riverpod'),
              Tab(icon: Icon(Icons.view_module), text: 'BLoC'),
              Tab(icon: Icon(Icons.account_tree), text: 'Provider'),
              Tab(icon: Icon(Icons.auto_awesome), text: 'MobX'),
            ],
          ),
        ),
        body: const TabBarView(
          // "Her tab, farklı bir state management yaklaşımını gösterir"
          children: [
            Riverpodexample(),
            Riverpodexample(),
            Riverpodexample(),
            Riverpodexample(),
          ],
        ),
      ),
    );
  }
}
