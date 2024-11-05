import 'package:daily/models/entry.dart';
import 'package:daily/services/firestore_service.dart';
import 'package:flutter/material.dart';

class EditEntryScreen extends StatelessWidget {
  final Entry entry;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  EditEntryScreen({required this.entry}) {
    titleController.text = entry.title;
    descriptionController.text = entry.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Entrada')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descrição'),
              maxLines: 5,
            ),
            ElevatedButton(
              onPressed: () async {
                final updatedEntry = Entry(
                  id: entry.id,
                  title: titleController.text,
                  description: descriptionController.text,
                  createdAt: entry.createdAt,
                );
                await _firestoreService.updateEntry(updatedEntry);
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
