import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Lifecycle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const LifecycleOrnegi(),
    );
  }
}

class LifecycleOrnegi extends StatefulWidget {
  const LifecycleOrnegi({Key? key}) : super(key: key);

  @override
  State<LifecycleOrnegi> createState() {
    print('📌 createState() çağrıldı');
    return _LifecycleOrnegiState();
  }
}

class _LifecycleOrnegiState extends State<LifecycleOrnegi> {
  int _sayac = 0;
  final List<String> _loglar = [];

  // ============================================
  // LIFECYCLE METODLARI
  // ============================================

  // 1. initState() - Widget ilk oluşturulduğunda bir kez çağrılır
  @override
  void initState() {
    super.initState();
    _logEkle('1️⃣ initState() - Widget oluşturuldu');
    print('✅ initState() çağrıldı');

    // Burada yapılabilecekler:
    // - Controller'ları başlatma
    // - API çağrıları
    // - Stream dinleme
    // - Timer başlatma
  }

  // 2. didChangeDependencies() - Bağımlılıklar değiştiğinde çağrılır
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _logEkle('2️⃣ didChangeDependencies() - Bağımlılıklar değişti');
    print('✅ didChangeDependencies() çağrıldı');

    // Burada yapılabilecekler:
    // - InheritedWidget'lardan veri alma
    // - Theme, MediaQuery gibi context'e bağlı işlemler
  }

  // 3. build() - Widget her çizildiğinde çağrılır
  @override
  Widget build(BuildContext context) {
    print('🎨 build() çağrıldı - Sayaç: $_sayac');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Lifecycle'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _loglar.clear();
              });
            },
            tooltip: 'Logları Temizle',
          ),
        ],
      ),
      body: Column(
        children: [
          // ============================================
          // SAYAÇ BÖLÜMÜ
          // ============================================
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.teal.shade50,
            child: Column(
              children: [
                const Text(
                  'Sayaç',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '$_sayac',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _sayac++;
                          _logEkle('🔄 setState() çağrıldı - Sayaç: $_sayac');
                        });
                      },
                      child: const Text('Arttır (setState)'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ============================================
          // LOG BÖLÜMÜ
          // ============================================
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.grey.shade300,
                    child: const Text(
                      'Lifecycle Logları',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: _loglar.isEmpty
                        ? const Center(
                            child: Text(
                              'Henüz log yok',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: _loglar.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${index + 1}.',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          _loglar[index],
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),

          // ============================================
          // BİLGİ BÖLÜMÜ
          // ============================================
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.amber.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '📚 Lifecycle Sırası:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('1. createState()'),
                Text('2. initState()'),
                Text('3. didChangeDependencies()'),
                Text('4. build()'),
                Text('5. setState() → build()'),
                Text('6. dispose()'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 4. didUpdateWidget() - Widget güncellendiğinde çağrılır
  @override
  void didUpdateWidget(LifecycleOrnegi oldWidget) {
    super.didUpdateWidget(oldWidget);
    _logEkle('4️⃣ didUpdateWidget() - Widget güncellendi');
    print('✅ didUpdateWidget() çağrıldı');
  }

  // 5. dispose() - Widget yok edildiğinde çağrılır
  @override
  void dispose() {
    _logEkle('5️⃣ dispose() - Widget yok ediliyor');
    print('❌ dispose() çağrıldı');

    // Burada yapılabilecekler:
    // - Controller'ları dispose etme
    // - Stream'leri kapatma
    // - Timer'ları iptal etme
    // - Listener'ları kaldırma

    super.dispose();
  }

  // ============================================
  // YARDIMCI METODLAR
  // ============================================

  void _logEkle(String mesaj) {
    if (mounted) {
      setState(() {
        _loglar.add('${DateTime.now().toString().substring(11, 19)} - $mesaj');
      });
    }
  }
}
