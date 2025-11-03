import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buton Örnekleri',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const ButonOrnekleri(),
    );
  }
}

class ButonOrnekleri extends StatefulWidget {
  const ButonOrnekleri({Key? key}) : super(key: key);

  @override
  State<ButonOrnekleri> createState() => _ButonOrnekleriState();
}

class _ButonOrnekleriState extends State<ButonOrnekleri> {
  int _tiklamaSayisi = 0;
  bool _butonAktif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buton Örnekleri'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ============================================
            // 1. ELEVATED BUTTON (Yükseltilmiş Buton)
            // ============================================
            _baslik('1. ElevatedButton'),
            const Text(
              'Yükseltilmiş, gölgeli buton. Ana aksiyonlar için kullanılır.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                _butonaTiklandi('ElevatedButton');
              },
              child: const Text('Basit ElevatedButton'),
            ),

            const SizedBox(height: 10),

            // İkonlu ElevatedButton
            ElevatedButton.icon(
              onPressed: () {
                _butonaTiklandi('İkonlu ElevatedButton');
              },
              icon: const Icon(Icons.send),
              label: const Text('Gönder'),
            ),

            const SizedBox(height: 10),

            // Özelleştirilmiş ElevatedButton
            ElevatedButton(
              onPressed: () {
                _butonaTiklandi('Özel ElevatedButton');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
              ),
              child: const Text(
                'Özelleştirilmiş Buton',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 10),

            // Devre dışı buton
            ElevatedButton(
              onPressed: null, // null = devre dışı
              child: const Text('Devre Dışı Buton'),
            ),

            const Divider(height: 40),

            // ============================================
            // 2. TEXT BUTTON (Metin Butonu)
            // ============================================
            _baslik('2. TextButton'),
            const Text(
              'Düz metin butonu. İkincil aksiyonlar için kullanılır.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            TextButton(
              onPressed: () {
                _butonaTiklandi('TextButton');
              },
              child: const Text('Basit TextButton'),
            ),

            const SizedBox(height: 10),

            // İkonlu TextButton
            TextButton.icon(
              onPressed: () {
                _butonaTiklandi('İkonlu TextButton');
              },
              icon: const Icon(Icons.info),
              label: const Text('Daha Fazla Bilgi'),
            ),

            const SizedBox(height: 10),

            // Özelleştirilmiş TextButton
            TextButton(
              onPressed: () {
                _butonaTiklandi('Özel TextButton');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 16,
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Sil'),
            ),

            const Divider(height: 40),

            // ============================================
            // 3. OUTLINED BUTTON (Çerçeveli Buton)
            // ============================================
            _baslik('3. OutlinedButton'),
            const Text(
              'Çerçeveli buton. Alternatif aksiyonlar için kullanılır.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: () {
                _butonaTiklandi('OutlinedButton');
              },
              child: const Text('Basit OutlinedButton'),
            ),

            const SizedBox(height: 10),

            // İkonlu OutlinedButton
            OutlinedButton.icon(
              onPressed: () {
                _butonaTiklandi('İkonlu OutlinedButton');
              },
              icon: const Icon(Icons.download),
              label: const Text('İndir'),
            ),

            const SizedBox(height: 10),

            // Özelleştirilmiş OutlinedButton
            OutlinedButton(
              onPressed: () {
                _butonaTiklandi('Özel OutlinedButton');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.orange,
                side: const BorderSide(color: Colors.orange, width: 2),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Özelleştirilmiş Çerçeveli Buton',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const Divider(height: 40),

            // ============================================
            // 4. ICON BUTTON (İkon Butonu)
            // ============================================
            _baslik('4. IconButton'),
            const Text(
              'Sadece ikon içeren buton. Toolbar\'larda kullanılır.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    _butonaTiklandi('Beğen');
                  },
                  icon: const Icon(Icons.favorite_border),
                  iconSize: 32,
                  color: Colors.red,
                  tooltip: 'Beğen',
                ),
                IconButton(
                  onPressed: () {
                    _butonaTiklandi('Yorum');
                  },
                  icon: const Icon(Icons.comment),
                  iconSize: 32,
                  color: Colors.blue,
                  tooltip: 'Yorum Yap',
                ),
                IconButton(
                  onPressed: () {
                    _butonaTiklandi('Paylaş');
                  },
                  icon: const Icon(Icons.share),
                  iconSize: 32,
                  color: Colors.green,
                  tooltip: 'Paylaş',
                ),
                IconButton(
                  onPressed: () {
                    _butonaTiklandi('Kaydet');
                  },
                  icon: const Icon(Icons.bookmark_border),
                  iconSize: 32,
                  color: Colors.amber,
                  tooltip: 'Kaydet',
                ),
              ],
            ),

            const Divider(height: 40),

            // ============================================
            // 5. FLOATING ACTION BUTTON
            // ============================================
            _baslik('5. FloatingActionButton'),
            const Text(
              'Yüzen aksiyon butonu. Ana aksiyon için kullanılır.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Normal FAB
                FloatingActionButton(
                  onPressed: () {
                    _butonaTiklandi('FAB');
                  },
                  child: const Icon(Icons.add),
                ),

                // Mini FAB
                FloatingActionButton.small(
                  onPressed: () {
                    _butonaTiklandi('Mini FAB');
                  },
                  child: const Icon(Icons.edit),
                ),

                // Extended FAB
                FloatingActionButton.extended(
                  onPressed: () {
                    _butonaTiklandi('Extended FAB');
                  },
                  icon: const Icon(Icons.navigation),
                  label: const Text('Yönlendir'),
                ),
              ],
            ),

            const Divider(height: 40),

            // ============================================
            // 6. ÖZEL BUTONLAR
            // ============================================
            _baslik('6. Özel Butonlar'),

            // Gradient buton
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  _butonaTiklandi('Gradient Buton');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Gradient Buton',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // İnkWell ile özel buton
            InkWell(
              onTap: () {
                _butonaTiklandi('InkWell Buton');
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal, width: 2),
                ),
                child: const Center(
                  child: Text(
                    'InkWell ile Özel Buton',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ============================================
            // TIKLAMA SAYACI
            // ============================================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    'Toplam Tıklama',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$_tiklamaSayisi',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _tiklamaSayisi = 0;
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Sıfırla'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Yardımcı metodlar
  Widget _baslik(String metin) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Text(
        metin,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  void _butonaTiklandi(String butonAdi) {
    setState(() {
      _tiklamaSayisi++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$butonAdi tıklandı!'),
        duration: const Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
