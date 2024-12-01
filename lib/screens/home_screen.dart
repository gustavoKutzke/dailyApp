
import '../models/entry.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import 'edit_entry_screen.dart';
import 'add_entry_screen.dart';


class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // Obtém o usuário atual autenticado
    final User? currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Diário Pessoal'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (currentUser != null) ...[
            // Informações do usuário autenticado
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blue.shade100,
              child: Row(
                children: [
                  // Exibe a foto do usuário, se disponível
                  if (currentUser.photoURL != null)
                    CircleAvatar(
                      backgroundImage: NetworkImage(currentUser.photoURL!),
                      radius: 30,
                    )
                  else
                    CircleAvatar(
                      child: Icon(Icons.person),
                      radius: 30,
                    ),
                  SizedBox(width: 16),
                  // Exibe nome e e-mail do usuário
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentUser.displayName ?? 'Usuário Anônimo',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        currentUser.email ?? 'E-mail não disponível',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          Expanded(
            // Lista de tarefas
            child: StreamBuilder<List<Entry>>(
              stream: FirestoreService().getEntries(),
              builder: (context, snapshot) {
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
                          FirestoreService().deleteEntry(entry.id);
                          ;
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
          ),
        ],
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
