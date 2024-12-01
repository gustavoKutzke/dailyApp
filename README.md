# **Daily App**  
Gerencie suas tarefas diárias de forma prática e eficiente.  
Este aplicativo Flutter permite autenticação, criação, edição e exclusão de tarefas, além de oferecer mensagens amigáveis e tratamento de erros.

---

## **Integrantes do Grupo**  
- **Gustavo Kutzke**  
- **Eduardo Da Silva**  
- **Leonardo**  

---

## **Listagem de Funções por Tela**  

### **Tela de Login**
- Autenticação do usuário via Firebase.
- Mensagens de erro detalhadas para:
  - Credenciais inválidas.
  - Falta de conexão com a internet.

### **Tela Home**
- Exibição das tarefas salvas pelo usuário autenticado.
- Funcionalidades:
  - Adicionar nova tarefa.
  - Editar tarefa existente.
  - Excluir tarefa.
  - Visualizar detalhes das tarefas.

### **Tela de Cadastro de Tarefas**
- Permite criar e salvar novas tarefas.
- Exibição de mensagens de sucesso ao salvar.
- Tratamento de erros com feedback claro.

---

## **Listagem de Tipos de Erros do Provedor**  

### **Firebase Authentication**
- `user-not-found`: Usuário não encontrado.
- `wrong-password`: Senha incorreta.
- `network-request-failed`: Falha de conexão com o servidor.
- `invalid-email`: Formato de e-mail inválido.

### **Firebase Firestore**
- `permission-denied`: Permissão negada ao usuário.
- `unavailable`: Servidor temporariamente indisponível.

### **Outros Erros**
- Sem conexão com a internet (tratado com **connectivity_plus**).
- Erros inesperados durante operações no aplicativo.

---

## **Dependências Utilizadas**

| Dependência               | Versão   |
|---------------------------|----------|
| `firebase_auth`           | ^4.7.3   |
| `cloud_firestore`         | ^5.5.1   |
| `connectivity_plus`       | ^3.0.3   |
| `provider`                | ^6.0.6   |
| `flutter_launcher_icons`  | ^0.12.0  |

---

## **Instruções de Configuração/Importação**

### **Pré-requisitos**
- Flutter SDK: **3.10.6**  
- Dart SDK: **3.1.0**  
- Versão mínima do SDK Android: **API 21 (Android 5.0)**  

### **Passo a Passo**
1. **Clone o repositório**:
   ```bash
   git clone https://github.com/gustavoKutzke/dailyApp.git
   cd dailyApp

   ## **Download do APK**  
- [Baixe aqui o Daily App](./apk/app-release.apk)

