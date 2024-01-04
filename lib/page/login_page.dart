import 'package:app_msg/auth/auth_servide.dart';
import 'package:app_msg/components/my_button.dart';
import 'package:app_msg/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  //criando o tap para ir ao register
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method
  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();

    //try login
    try {
      await authService.signInWithEmailPassword(
        email.text,
        pass.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            height: 50,
          ),
          //welcome back
          Text(
            "Bem vindo de volta!! Sentimos sua falta",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          //email textfiel
          MyTextField(
            hintText: 'E-mail',
            obscure: false,
            controller: email,
          ),
          const SizedBox(
            height: 10,
          ),
          //pass texfield
          MyTextField(
            hintText: 'Password',
            obscure: true,
            controller: pass,
          ),
          const SizedBox(
            height: 25,
          ),
          //login button
          MyButton(
            text: 'Login',
            onTap: () => login(context),
          ),
          const SizedBox(
            height: 25,
          ),
          //register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Não é membro? ',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'Registre agora!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
