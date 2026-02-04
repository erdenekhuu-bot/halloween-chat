import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Column(
        children: [
          SizedBox(
            child: Image.asset('assets/login.png'),
          ),
          const SizedBox(height: 40),
          Center(child: Text('Login in',style: TextStyle(fontSize: 30))),
        ],
      ),
    );
  }
}
