import 'package:daily/screens/add_entry_screen.dart';
import 'package:daily/services/firestore_service.dart';
import 'package:flutter/material.dart';
import '../models/entry.dart';
import 'edit_entry_screen.dart';

class HomeScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diário Pessoal')),
      body: StreamBuilder<List<Entry>>(
        stream: _firestoreService.getEntries(),
        builder: (context, snapshot) {
          // Adicionando um print para verificar os dados recebidos
          print('Dados recebidos: ${snapshot.data}');

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhuma entrada encontrada.'));
          }

          final entries = snapshot.data!;

          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                title: Text(entry.title),
                subtitle: Text(entry.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _firestoreService.deleteEntry(entry.id);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditEntryScreen(entry: entry),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEntryScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
