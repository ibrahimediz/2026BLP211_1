import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yapılacaklar Listesi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const TodoListeSayfasi(),
    );
  }
}

// ============================================
// TODO MODEL (Veri Yapısı)
// ============================================
class Todo {
  String baslik;
  String aciklama;
  bool tamamlandiMi;
  DateTime olusturmaTarihi;

  Todo({
    required this.baslik,
    this.aciklama = '',
    this.tamamlandiMi = false,
    DateTime? olusturmaTarihi,
  }) : olusturmaTarihi = olusturmaTarihi ?? DateTime.now();
}

// ============================================
// ANA SAYFA
// ============================================
class TodoListeSayfasi extends StatefulWidget {
  const TodoListeSayfasi({Key? key}) : super(key: key);

  @override
  State<TodoListeSayfasi> createState() => _TodoListeSayfasiState();
}

class _TodoListeSayfasiState extends State<TodoListeSayfasi> {
  // Todo listesi
  final List<Todo> _todoListesi = [
    Todo(baslik: 'Flutter öğren', aciklama: 'Widget\'ları çalış'),
    Todo(baslik: 'Proje yap', aciklama: 'To-Do uygulaması geliştir'),
    Todo(baslik: 'Spor yap', aciklama: '30 dakika koşu', tamamlandiMi: true),
  ];

  // TextField controller'ları
  final TextEditingController _baslikController = TextEditingController();
  final TextEditingController _aciklamaController = TextEditingController();

  @override
  void dispose() {
    _baslikController.dispose();
    _aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // İstatistikler
    int toplamGorev = _todoListesi.length;
    int tamamlananGorev = _todoListesi
        .where((todo) => todo.tamamlandiMi)
        .length;
    int kalanGorev = toplamGorev - tamamlananGorev;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yapılacaklar Listesi'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: _tamamlananGorevleriSil,
            tooltip: 'Tamamlananları Sil',
          ),
        ],
      ),
      body: Column(
        children: [
          // ============================================
          // İSTATİSTİK KARTI
          // ============================================
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade400, Colors.indigo.shade700],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _istatistikItem('Toplam', toplamGorev, Icons.list),
                _istatistikItem('Kalan', kalanGorev, Icons.pending_actions),
                _istatistikItem(
                  'Tamamlanan',
                  tamamlananGorev,
                  Icons.check_circle,
                ),
              ],
            ),
          ),

          // ============================================
          // TODO LİSTESİ
          // ============================================
          Expanded(
            child: _todoListesi.isEmpty
                ? _bosListeWidget()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _todoListesi.length,
                    itemBuilder: (context, index) {
                      final todo = _todoListesi[index];
                      return _todoKarti(todo, index);
                    },
                  ),
          ),
        ],
      ),

      // ============================================
      // YENİ GÖREV EKLEME BUTONU
      // ============================================
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _yeniGorevEkleDialog,
        icon: const Icon(Icons.add),
        label: const Text('Yeni Görev'),
      ),
    );
  }

  // ============================================
  // WIDGET METODLARI
  // ============================================

  // İstatistik item
  Widget _istatistikItem(String baslik, int sayi, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 8),
        Text(
          '$sayi',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          baslik,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }

  // Boş liste widget'ı
  Widget _bosListeWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox, size: 100, color: Colors.grey.shade300),
          const SizedBox(height: 20),
          Text(
            'Henüz görev yok',
            style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 10),
          Text(
            'Yeni görev eklemek için + butonuna basın',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  // Todo kartı
  Widget _todoKarti(Todo todo, int index) {
    return Dismissible(
      // Kaydırarak silme
      key: Key(todo.olusturmaTarihi.toString()),
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white, size: 30),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          _todoListesi.removeAt(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${todo.baslik} silindi'),
            action: SnackBarAction(
              label: 'Geri Al',
              onPressed: () {
                setState(() {
                  _todoListesi.insert(index, todo);
                });
              },
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          // Checkbox
          leading: Checkbox(
            value: todo.tamamlandiMi,
            onChanged: (value) {
              setState(() {
                todo.tamamlandiMi = value ?? false;
              });
            },
            shape: const CircleBorder(),
          ),
          // Başlık ve açıklama
          title: Text(
            todo.baslik,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: todo.tamamlandiMi ? TextDecoration.lineThrough : null,
              color: todo.tamamlandiMi ? Colors.grey : Colors.black,
            ),
          ),
          subtitle: todo.aciklama.isNotEmpty
              ? Text(
                  todo.aciklama,
                  style: TextStyle(
                    decoration: todo.tamamlandiMi
                        ? TextDecoration.lineThrough
                        : null,
                    color: todo.tamamlandiMi ? Colors.grey : Colors.black54,
                  ),
                )
              : null,
          // Düzenle butonu
          trailing: IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () => _gorevDuzenleDialog(todo, index),
          ),
        ),
      ),
    );
  }

  // ============================================
  // FONKSİYONLAR
  // ============================================

  // Yeni görev ekleme dialog'u
  void _yeniGorevEkleDialog() {
    _baslikController.clear();
    _aciklamaController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Yeni Görev Ekle'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _baslikController,
              decoration: const InputDecoration(
                labelText: 'Başlık',
                hintText: 'Görev başlığı',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _aciklamaController,
              decoration: const InputDecoration(
                labelText: 'Açıklama (Opsiyonel)',
                hintText: 'Görev açıklaması',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_baslikController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Başlık boş olamaz!'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              setState(() {
                _todoListesi.add(
                  Todo(
                    baslik: _baslikController.text.trim(),
                    aciklama: _aciklamaController.text.trim(),
                  ),
                );
              });

              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Görev eklendi!'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text('Ekle'),
          ),
        ],
      ),
    );
  }

  // Görev düzenleme dialog'u
  void _gorevDuzenleDialog(Todo todo, int index) {
    _baslikController.text = todo.baslik;
    _aciklamaController.text = todo.aciklama;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Görevi Düzenle'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _baslikController,
              decoration: const InputDecoration(
                labelText: 'Başlık',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _aciklamaController,
              decoration: const InputDecoration(
                labelText: 'Açıklama',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_baslikController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Başlık boş olamaz!'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              setState(() {
                todo.baslik = _baslikController.text.trim();
                todo.aciklama = _aciklamaController.text.trim();
              });

              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Görev güncellendi!'),
                  backgroundColor: Colors.blue,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text('Güncelle'),
          ),
        ],
      ),
    );
  }

  // Tamamlanan görevleri sil
  void _tamamlananGorevleriSil() {
    int silinecekSayi = _todoListesi.where((todo) => todo.tamamlandiMi).length;

    if (silinecekSayi == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tamamlanmış görev yok!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Emin misiniz?'),
        content: Text('$silinecekSayi tamamlanmış görev silinecek.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _todoListesi.removeWhere((todo) => todo.tamamlandiMi);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$silinecekSayi görev silindi!'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Sil'),
          ),
        ],
      ),
    );
  }
}
