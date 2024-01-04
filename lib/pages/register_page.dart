import 'package:app_msg/services/auth/auth_servide.dart';
import 'package:app_msg/components/my_button.dart';
import 'package:app_msg/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //register method
  void register(BuildContext context) async{
    //pegando o auth service
    final _auth = AuthService();
    //passwords iguais -> criando usuário
    if(pass.text == confirmPass.text ){
      try{
        _auth.signUpWithEmailPassword(email.text, pass.text);
      }catch(e){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
        ),
      );
      }
    }
    //passwords diferentes -> mostrar erro na tela
    else{
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("As senhas não são iguais, por favor corrija as senhas!"),
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
            "Vamos criar uma conta para você!!",
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
            height: 10,
          ),
          MyTextField(
            hintText: 'Confirmar password',
            obscure: true,
            controller: confirmPass,
          ),
          const SizedBox(
            height: 25,
          ),
          //login button
          MyButton(
            text: 'Registrar',
            onTap: () => register(context),
          ),
          const SizedBox(
            height: 25,
          ),
          //register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Já tem uma conta? ',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'Entre agora!',
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
