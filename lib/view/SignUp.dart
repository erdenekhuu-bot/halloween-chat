import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/ListColor.dart';
import '../http/CallAPI.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Listcolor.textWhite),
        backgroundColor: Listcolor.backgroundColor,
        foregroundColor: Listcolor.textWhite,
        title: Text('SignUp',style: TextStyle(color: Listcolor.textWhite)),
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
                  Text('Sign up dear member',style: TextStyle(fontSize: 30)),
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
                        int response = await CallAPI.register(nameController.value.text, passwordController.value.text);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text(response > 0 ? "Success" : "Error"),
                              content: Text(response > 0
                                  ? "You are joined"
                                  : "Oops! Something went wrong."
                              ),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );

                        nameController.clear();
                        passwordController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Listcolor.backgroundColor,
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text('Gotcha', style: TextStyle(color: Listcolor.textWhite)),
                    ),
                  )

                ],
              )),
        ],
      ),
    );
  }
}
