import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.login),
          label: Text('Entrar com Google'),
          onPressed: () async {
            User? user = await _authService.signInWithGoogle();
            if (user != null) {
              // Autenticação bem-sucedida
              print('Usuário logado: ${user.displayName}');
            } else {
              // Falha na autenticação
              print('Erro no login');
            }
          },
        ),
      ),
    );
  }
}
