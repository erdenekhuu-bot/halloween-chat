import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/Route.dart';
import 'view/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.black)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('CHATROOM FREE'),
        ),
        body: Column(
          children: [
            SizedBox(
              child: Image.asset('assets/pic.png'),
            ),
            const SizedBox(height: 40),
            Center(child: Text('Welcome to new member',style: TextStyle(fontSize: 30))),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: null, child: Text('Visit chatroom', style: TextStyle(color: Colors.black),)),
            ElevatedButton(onPressed: ()=>Get.toNamed(Routes.login), child: Text('Register member', style: TextStyle(color: Colors.black),))
          ],
        ),

      ),
      initialRoute: Routes.main,
      getPages: [
        GetPage(name: Routes.login, page: ()=>Login())
      ],
    );
  }
}
