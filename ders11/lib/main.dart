import 'package:flutter/material.dart';
import 'package:hafta11/detay.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: HomePage()));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetayPage(mesaj1: "Selamlar", sayi1: 255),
                ),
              );
            },
            child: Text("Sayfa"),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _detayGetir(context);
            },
            child: Text("Detay"),
          ),
        ),
      ],
    );
  }

  void _detayGetir(BuildContext context) async {
    final sonuc = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetayPage(mesaj1: "Selamlar", sayi1: 255),
      ),
    );
    if (sonuc != null) {
      print(sonuc);
    }
  }
}
