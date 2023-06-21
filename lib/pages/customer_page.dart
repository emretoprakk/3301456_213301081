import 'package:coffee_shop/data/sql_helper.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  _CustomerPage createState() => _CustomerPage();
}

class _CustomerPage extends State<CustomerPage> {
  // All comment
  List<Map<String, dynamic>> _comment = [];

  bool _isLoading = true;
  // veritabanındaki tüm verileri almak için kullanılır.
  void _refreshComments() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _comment = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshComments(); // Uygulama başladığında günlüğün yüklenmesi
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Bu fonksiyon kayan butona basıldığında tetiklenecektir.
  // Bir öğeyi güncellemek istediğinizde de tetiklenecektir.
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> yeni öğe oluştur
      // id != null -> mevcut bir öğeyi güncelleme
      final existingComment =
      _comment.firstWhere((element) => element['id'] == id);
      _titleController.text = existingComment['title'];
      _descriptionController.text = existingComment['description'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            // yazılım klavyesinin metin alanlarını kaplamasını önleyecektir
            bottom: MediaQuery.of(context).viewInsets.bottom + 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(hintText: 'Description'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Save new comment
                  if (id == null) {
                    await _addItem();
                  }

                  if (id != null) {
                    await _updateItem(id);
                  }

                  // Text Fields temizle
                  _titleController.text = '';
                  _descriptionController.text = '';

                  // popla cikan sayfayi kapa
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                ),
                child: Text(id == null ? 'Create New' : 'Update'),

              )
            ],
          ),
        ));
  }

// Veritabanına yeni bir comment ekle
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, _descriptionController.text);
    _refreshComments();
  }

  // Mevcut bir commenti güncelleme
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _refreshComments();
  }

  // Silme islemi
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Gorusunuz basariyla silindi!'),
    ));
    _refreshComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Musteri Gorusleri'),
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _comment.length,
        itemBuilder: (context, index) => Card(
          color: Colors.blueGrey[300],
          margin: const EdgeInsets.all(15),
          child: ListTile(
              title: Text(_comment[index]['title']),
              subtitle: Text(_comment[index]['description']),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showForm(_comment[index]['id']),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          _deleteItem(_comment[index]['id']),
                    ),
                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}