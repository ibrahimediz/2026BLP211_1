import 'package:flutter/material.dart';

class DetayPage extends StatelessWidget {
  final String mesaj1;
  final int sayi1;
  const DetayPage({super.key, required this.mesaj1, required this.sayi1});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "Geri Dönüldü");
                },
                child: Text("Ana Ekran"),
              ),
            ],
          ),
          Row(children: [Text(mesaj1), 
          Text(sayi1.toString())]),
        ],
      ),
    );
  }
}
