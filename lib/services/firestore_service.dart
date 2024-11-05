import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/entry.dart';

class FirestoreService {
  final CollectionReference _entriesCollection =
  FirebaseFirestore.instance.collection('entradas');

  // Método para adicionar uma entrada
  Future<void> addEntry(Entry entry) async {
    try {
      await _entriesCollection.add(entry.toMap());
    } catch (e) {
      print('Erro ao adicionar entrada: $e');
    }
  }

  // Método para atualizar uma entrada
  Future<void> updateEntry(Entry entry) async {
    try {
      await _entriesCollection.doc(entry.id).update(entry.toMap());
    } catch (e) {
      print('Erro ao atualizar entrada: $e');
    }
  }

  // Método para deletar uma entrada
  Future<void> deleteEntry(String id) async {
    try {
      await _entriesCollection.doc(id).delete();
    } catch (e) {
      print('Erro ao deletar entrada: $e');
    }
  }

  // Método para obter as entradas
  Stream<List<Entry>> getEntries() {
    return _entriesCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Entry.fromFirestore(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }
}
