import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_screen.dart';
// import '../services/firestore_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase & Bloc")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text("Veri Listesi Burada Olacak\n(StreamBuilder)"),

        // TODO: Derste burası StreamBuilder ile değiştirilecek
        /*
        StreamBuilder(
          stream: FirestoreService().getDataStream(),
          builder: (context, snapshot) {
            // Liste kodları...
          }
        )
        */
      ),
    );
  }
}
