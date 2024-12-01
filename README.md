Daily App
Este é um aplicativo desenvolvido em Flutter para gerenciamento de tarefas diárias. Ele permite autenticação, CRUD de tarefas, e possui tratamento de erros e mensagens amigáveis.

Integrantes do Grupo
Gustavo Kutzke , Eduardo Da Silva e Leonardo 

Listagem de Funções por Tela
*Tela de Login:
  *Autenticação do usuário via Firebase.
  *Exibição de erros para credenciais inválidas ou falta de conexão.
*Tela Home:
  *Exibe as entradas salvas do usuário autenticado.
  *Função de adicionar, editar, excluir e visualizar tarefas.
*Tela de Cadastro de Tarefas:
  *Permite criar e salvar novas tarefas.
  *Mensagem de sucesso ao salvar ou erros detalhados.

  *Listagem de Tipos de Erros do Provedor
Firebase Authentication:
1.user-not-found: Usuário não encontrado.
2.wrong-password: Senha incorreta.
3.network-request-failed: Falha de conexão.
4.invalid-email: E-mail inválido.
Firebase Firestore
1.permission-denied: Usuário não tem permissão.
2.unavailable: Servidor indisponível.
Outros Erros
1.Sem conexão com a internet (tratado via connectivity_plus).
2.Falha geral durante requisições.

Dependências Utilizadas
Dependência	Versão
*firebase_auth	^4.7.3
*cloud_firestore	^5.5.1
*connectivity_plus	^3.0.3
*provider	^6.0.6
*flutter_launcher_icons	^0.12.0

*Instruções de Configuração/Importação
Pré-requisitos:
Flutter SDK: 3.10.6.
Dart SDK: 3.1.0.
Versão mínima do SDK Android: API 21 (Android 5.0).
*Passo a Passo
Clone o repositório:
git clone [https://github.com/usuario/my_flutter_app.git](https://github.com/gustavoKutzke/dailyApp)
Instale as dependências:
flutter pub get
Verifique o ambiente:
flutter doctor
Execute o aplicativo no emulador/dispositivo:
flutter run
