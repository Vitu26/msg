import 'package:app_msg/components/drawer.dart';
import 'package:app_msg/components/user_tile.dart';
import 'package:app_msg/pages/chat_page.dart';
import 'package:app_msg/services/auth/auth_servide.dart';
import 'package:app_msg/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat e auth service
  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

Widget _buildUserList() {
  return StreamBuilder<List<Map<String, dynamic>>>(
    stream: _chatServices.getUsersStream(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text('Loading...');
      }
      // Verificando se há dados e se a lista não está vazia
      if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const Text('No users found.');
      }
      // Construindo a lista de usuários
      return ListView(
        children: snapshot.data!
            .map<Widget>((userData) => _buildUserListItem(userData, context))
            .toList(),
      );
    },
  );
}



  //build individual list tile
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
