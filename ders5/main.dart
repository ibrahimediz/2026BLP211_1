import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold Temelleri',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const ScaffoldOrnekleri(),
    );
  }
}

class ScaffoldOrnekleri extends StatelessWidget {
  const ScaffoldOrnekleri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ============================================
    // SCAFFOLD: Material Design'ın temel yapısı
    // ============================================
    // Scaffold, bir sayfanın iskeletini oluşturur
    // AppBar, Body, BottomNavigationBar, Drawer, FAB gibi
    // bileşenleri barındırır

    return Scaffold(
      // ============================================
      // 1. APP BAR (Üst Çubuk)
      // ============================================
      appBar: AppBar(
        // Sol taraf: Otomatik geri butonu veya drawer ikonu
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          tooltip: 'Menü',
        ),

        // Başlık
        title: const Text('Scaffold Örneği'),

        // Başlığı ortala
        centerTitle: true,

        // Sağ taraf: Action butonları
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('Arama tıklandı');
            },
            tooltip: 'Ara',
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              print('Bildirimler tıklandı');
            },
            tooltip: 'Bildirimler',
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              print('Daha fazla tıklandı');
            },
            tooltip: 'Daha Fazla',
          ),
        ],

        // AppBar yüksekliği (gölge)
        elevation: 4,

        // Arkaplan rengi (theme'den alınır, özelleştirilebilir)
        // backgroundColor: Colors.indigo,
      ),

      // ============================================
      // 2. BODY (Ana İçerik)
      // ============================================
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.widgets, size: 100, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text(
              'Scaffold Bileşenleri',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'AppBar, Body, FloatingActionButton, Drawer ve daha fazlası!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // SnackBar gösterme
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Merhaba! Bu bir SnackBar'),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.info),
              label: const Text('SnackBar Göster'),
            ),
          ],
        ),
      ),

      // ============================================
      // 3. FLOATING ACTION BUTTON (Yüzen Buton)
      // ============================================
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FAB tıklandı');
        },
        tooltip: 'Ekle',
        child: const Icon(Icons.add),
      ),

      // FAB konumu
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // ============================================
      // 4. BOTTOM NAVIGATION BAR (Alt Navigasyon)
      // ============================================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Seçili olan index
        onTap: (index) {
          print('Tıklanan index: $index');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Keşfet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),

      // ============================================
      // 5. DRAWER (Yan Menü)
      // ============================================
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer başlığı
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.indigo, Colors.blue]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.indigo),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kullanıcı Adı',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'kullanici@example.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapat
                print('Ana Sayfa tıklandı');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
                print('Ayarlar tıklandı');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Yardım'),
              onTap: () {
                Navigator.pop(context);
                print('Yardım tıklandı');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text(
                'Çıkış Yap',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                print('Çıkış yapıldı');
              },
            ),
          ],
        ),
      ),
    );
  }
}
