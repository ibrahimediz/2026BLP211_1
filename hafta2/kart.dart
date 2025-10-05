import 'package:flutter/material.dart';

class KartOrnek extends StatelessWidget {
  const KartOrnek({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blueGrey,
                ),
                child: Text(
                  "Merhaba MYO",
                  style: TextStyle(fontSize: 40, color: Colors.red),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blueGrey,
                ),
                child: Text(
                  "Merhaba MYO",
                  style: TextStyle(fontSize: 40, color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
