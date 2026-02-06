import 'package:flutter/material.dart';
import '../utils/ListColor.dart';
import '../http/CallAPI.dart';
import '../utils/Stack.dart';
import 'package:get/get.dart';
import '../app/Route.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Listcolor.textWhite),
        backgroundColor: Listcolor.backgroundColor,
        foregroundColor: Listcolor.textWhite,
        title: Text('Login',style: TextStyle(color: Listcolor.textWhite)),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Image.asset('assets/login.png'),
          ),
          const SizedBox(height: 40),
          Center(
              child: Column(
                children:  <Widget>[
                  Text('Log in',style: TextStyle(fontSize: 30)),
                  SizedBox(height: 40),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.face_6),
                        border: OutlineInputBorder(),
                        hintText: 'Nickname',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200.0,
                    child: ElevatedButton(
                      onPressed: () async {
                          int response = await CallAPI.login(nameController.value.text, passwordController.value.text);
                          nameController.clear();
                          passwordController.clear();
                          if(response == 1) Get.toNamed(Routes.home);
                          },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Listcolor.backgroundColor,
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                          ),
                      child: Text('Log in', style: TextStyle(color: Listcolor.textWhite)),
                        ),
                    ),
                ],
              )),
        ],
      ),
    );
  }
}
