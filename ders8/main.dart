import 'package:flutter/material.dart';
import 'package:hafta8/lifecycleornegi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Temelleri',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const StateKavramiSayfasi(),
    );
  }
}

class StateKavramiSayfasi extends StatelessWidget {
  const StateKavramiSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State (Durum) Nedir?'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ============================================
          // STATE KAVRAMI AÇIKLAMA
          // ============================================
          _aciklamaKarti(
            'State (Durum) Nedir?',
            'State, bir widget\'ın değişebilen verisidir. '
                'Kullanıcı etkileşimleri, ağ istekleri veya zamanlayıcılar '
                'sonucunda değişebilir.',
            Icons.info,
            Colors.blue,
          ),

          const SizedBox(height: 16),

          _aciklamaKarti(
            'StatelessWidget',
            'Durumu olmayan widget. Bir kez oluşturulur ve değişmez. '
                'Sadece dışarıdan gelen parametrelere bağlıdır.',
            Icons.block,
            Colors.orange,
          ),

          const SizedBox(height: 16),

          _aciklamaKarti(
            'StatefulWidget',
            'Durumu olan widget. İçinde değişebilen veriler barındırır. '
                'setState() ile yeniden çizilir.',
            Icons.refresh,
            Colors.green,
          ),

          const SizedBox(height: 24),

          // ============================================
          // ÖRNEKLER
          // ============================================
          const Text(
            'Örnekler',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          _ornekButon(
            context,
            'Basit Sayaç',
            'setState() temel kullanımı',
            Icons.add,
            Colors.blue,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BasitSayac()),
            ),
          ),

          _ornekButon(
            context,
            'Çoklu State',
            'Birden fazla state değişkeni',
            Icons.dashboard,
            Colors.purple,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CokluState()),
            ),
          ),

          _ornekButon(
            context,
            'State Lifecycle',
            'Widget yaşam döngüsü',
            Icons.timeline,
            Colors.teal,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LifecycleOrnegi()),
            ),
          ),

          // _ornekButon(
          //   context,
          //   'State Lifting',
          //   'Durumu yukarı taşıma',
          //   Icons.arrow_upward,
          //   Colors.orange,
          //   () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const StateLiftingOrnegi(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _aciklamaKarti(
    String baslik,
    String aciklama,
    IconData icon,
    Color renk,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: renk.withOpacity(0.2),
              child: Icon(icon, color: renk),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    baslik,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    aciklama,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ornekButon(
    BuildContext context,
    String baslik,
    String aciklama,
    IconData icon,
    Color renk,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: renk,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          baslik,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(aciklama),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

// ============================================
// 1. BASİT SAYAÇ ÖRNEĞİ
// ============================================
class BasitSayac extends StatefulWidget {
  const BasitSayac({Key? key}) : super(key: key);

  @override
  State<BasitSayac> createState() => _BasitSayacState();
}

class _BasitSayacState extends State<BasitSayac> {
  // ============================================
  // STATE DEĞİŞKENLERİ
  // ============================================
  // Bu değişkenler widget'ın durumunu temsil eder
  // setState() çağrıldığında widget yeniden çizilir

  int _sayac = 0;

  // ============================================
  // METODLAR
  // ============================================

  void _arttir() {
    // setState() içinde state değişkenini değiştiriyoruz
    // Bu, Flutter'a widget'ı yeniden çizmesini söyler
    setState(() {
      _sayac++;
    });

    print('Sayaç artırıldı: $_sayac');
  }

  void _azalt() {
    setState(() {
      _sayac--;
    });

    print('Sayaç azaltıldı: $_sayac');
  }

  void _sifirla() {
    setState(() {
      _sayac = 0;
    });

    print('Sayaç sıfırlandı');
  }

  @override
  Widget build(BuildContext context) {
    // build() metodu her setState() çağrısında tekrar çalışır
    print('build() metodu çalıştı');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basit Sayaç'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _sifirla,
            tooltip: 'Sıfırla',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ============================================
            // SAYAÇ GÖSTERGE
            // ============================================
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 4),
              ),
              child: Text(
                '$_sayac',
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ============================================
            // BUTONLAR
            // ============================================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Azalt butonu
                FloatingActionButton(
                  onPressed: _azalt,
                  heroTag: 'azalt',
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.remove),
                ),

                const SizedBox(width: 20),

                // Arttır butonu
                FloatingActionButton(
                  onPressed: _arttir,
                  heroTag: 'arttir',
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // ============================================
            // BİLGİ KARTI
            // ============================================
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber),
              ),
              child: Column(
                children: [
                  const Icon(Icons.info, color: Colors.amber, size: 30),
                  const SizedBox(height: 8),
                  const Text(
                    'setState() Kullanımı',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Her buton tıklamasında setState() çağrılır '
                    've widget yeniden çizilir.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// 2. ÇOKLU STATE ÖRNEĞİ
// ============================================
class CokluState extends StatefulWidget {
  const CokluState({Key? key}) : super(key: key);

  @override
  State<CokluState> createState() => _CokluStateState();
}

class _CokluStateState extends State<CokluState> {
  // ============================================
  // ÇOKLU STATE DEĞİŞKENLERİ
  // ============================================

  int _sayac = 0;
  bool _aktif = true;
  double _slider = 50.0;
  String _secilenRenk = 'Mavi';
  Color _renk = Colors.blue;
  bool _switchDurumu = false;

  // Liste state
  final List<String> _renkler = ['Mavi', 'Kırmızı', 'Yeşil', 'Turuncu', 'Mor'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Çoklu State Yönetimi')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ============================================
            // 1. SAYAÇ STATE
            // ============================================
            _baslik('1. Sayaç State'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Sayaç: $_sayac',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _sayac--;
                            });
                          },
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _sayac++;
                            });
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ============================================
            // 2. BOOLEAN STATE (CHECKBOX)
            // ============================================
            _baslik('2. Boolean State (Checkbox)'),
            Card(
              child: CheckboxListTile(
                title: const Text('Aktif/Pasif'),
                subtitle: Text(_aktif ? 'Aktif' : 'Pasif'),
                value: _aktif,
                onChanged: (value) {
                  setState(() {
                    _aktif = value ?? false;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            // ============================================
            // 3. DOUBLE STATE (SLIDER)
            // ============================================
            _baslik('3. Double State (Slider)'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Değer: ${_slider.toInt()}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: _slider,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: _slider.toInt().toString(),
                      onChanged: (value) {
                        setState(() {
                          _slider = value;
                        });
                      },
                    ),
                    // Slider değerine göre progress bar
                    LinearProgressIndicator(
                      value: _slider / 100,
                      minHeight: 10,
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ============================================
            // 4. STRING STATE (DROPDOWN)
            // ============================================
            _baslik('4. String State (Dropdown)'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: _secilenRenk,
                      isExpanded: true,
                      items: _renkler.map((String renk) {
                        return DropdownMenuItem<String>(
                          value: renk,
                          child: Text(renk),
                        );
                      }).toList(),
                      onChanged: (String? yeniRenk) {
                        setState(() {
                          _secilenRenk = yeniRenk!;
                          // Renk değiştir
                          switch (_secilenRenk) {
                            case 'Mavi':
                              _renk = Colors.blue;
                              break;
                            case 'Kırmızı':
                              _renk = Colors.red;
                              break;
                            case 'Yeşil':
                              _renk = Colors.green;
                              break;
                            case 'Turuncu':
                              _renk = Colors.orange;
                              break;
                            case 'Mor':
                              _renk = Colors.purple;
                              break;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: _renk,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          _secilenRenk,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ============================================
            // 5. SWITCH STATE
            // ============================================
            _baslik('5. Switch State'),
            Card(
              child: SwitchListTile(
                title: const Text('Bildirimler'),
                subtitle: Text(_switchDurumu ? 'Açık' : 'Kapalı'),
                value: _switchDurumu,
                onChanged: (value) {
                  setState(() {
                    _switchDurumu = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            // ============================================
            // TÜM STATE'LERİ SIFIRLA
            // ============================================
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _sayac = 0;
                  _aktif = true;
                  _slider = 50.0;
                  _secilenRenk = 'Mavi';
                  _renk = Colors.blue;
                  _switchDurumu = false;
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Tümünü Sıfırla'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _baslik(String metin) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        metin,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
