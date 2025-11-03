import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Metin Kutusu Örnekleri'),
          centerTitle: true,
        ),
        body: MetinKutusu(),
      ),
    );
  }
}

class MetinKutusu extends StatefulWidget {
  const MetinKutusu({super.key});

  @override
  State<MetinKutusu> createState() => _MetinKutusuState();
}

class _MetinKutusuState extends State<MetinKutusu> {
  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();

  bool _gizliSifre = true;

  @override
  void dispose() {
    _sifreController.dispose();
    _isimController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: _isimController,
            decoration: InputDecoration(
              labelText: 'İsim',
              hintText: 'İsminizi Giriniz',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Emailinizi Giriniz',
              prefixIcon: Icon(Icons.email),
              helperText: 'Lütfen geçerli bir email adresi giriniz.',
              suffixIcon: Icon(Icons.check),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          ////////////////////Şifre
          TextField(
            controller: _sifreController,
            obscureText: _gizliSifre,
            decoration: InputDecoration(
              labelText: 'Şifre',
              hintText: 'Şifrenizi Giriniz!!!',
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _gizliSifre = !_gizliSifre;
                  });
                },
                icon: Icon(Icons.remove_red_eye),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          ////////////////////////////
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print(_isimController.text);
              _isimController.clear();
            },
            child: Text('Gönder'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
