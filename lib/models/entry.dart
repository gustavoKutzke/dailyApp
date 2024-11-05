import 'package:cloud_firestore/cloud_firestore.dart';

class Entry {
  final String id;
  final String title;
  final String description;
  final Timestamp createdAt; // Nova propriedade para a data de criação

  Entry({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt, // Adicionando a nova propriedade no construtor
  });

  // Método para criar uma instância de Entry a partir de um mapa
  factory Entry.fromFirestore(Map<String, dynamic> data, String id) {
    return Entry(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      createdAt: data['createdAt'] ?? Timestamp.now(), // Usando agora o createdAt
    );
  }

  // Método para converter a instância de Entry em um mapa
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt, // Adicionando o createdAt ao mapa
    };
  }
}
