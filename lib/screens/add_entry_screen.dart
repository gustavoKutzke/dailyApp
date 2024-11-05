import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/entry.dart';
import '../services/firestore_service.dart';

class AddEntryScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefa'),
      ),
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
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await addEntry(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addEntry(BuildContext context) async {
    // Verifica se os campos estão vazios
    if (titleController.text.isEmpty && descriptionController.text.isEmpty) {
      // Exibir um alerta se os campos estiverem vazios
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha pelo menos um campo.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Adiciona a entrada
    try {
      Entry newEntry = Entry(
        title: titleController.text,
        description: descriptionController.text,
        createdAt: Timestamp.now(),
        id: '', // O id será gerado pelo Firestore
      );
      await _firestoreService.addEntry(newEntry);

      // Exibir SnackBar de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Salvo a Tarefa Com Sucesso'),
          duration: Duration(seconds: 2),
        ),
      );

      // Limpa os campos após adicionar
      titleController.clear();
      descriptionController.clear();

    } catch (e) {
      print('Erro ao adicionar entrada: $e');
      // Exibir mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao adicionar tarefa. Tente novamente.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
