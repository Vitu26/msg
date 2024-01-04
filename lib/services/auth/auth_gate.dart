import 'package:app_msg/services/auth/login_or_register.dart';
import 'package:app_msg/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          //se o usuário estiver logado
          if (snapshot.hasData) {
            return HomePage();
          } 
          //caso não esteja logado
          else {
            return const LoginOrRegister();
          }
        }),
      ),
    );
  }
}
