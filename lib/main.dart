import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halloween/view/Home.dart';
import 'app/Route.dart';
import 'view/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'utils/ListColor.dart';
import 'view/SignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Listcolor.backgroundColor,
          title: Text('CHATROOM FREE',style: TextStyle(color: Listcolor.textWhite)),
        ),
        body: Column(
          children: [
            SizedBox(
              child: Image.asset('assets/pic.png'),
            ),
            const SizedBox(height: 40),
            Center(child: Text('Welcome to new member',style: TextStyle(fontSize: 30))),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: ()=>Get.toNamed(Routes.home), child: Text('Visit chatroom', style: TextStyle(color: Colors.black),)),
            ElevatedButton(onPressed: ()=>Get.toNamed(Routes.signup), child: Text('Join member', style: TextStyle(color: Colors.black),))
          ],
        ),

      ),
      initialRoute: Routes.main,
      getPages: [
        GetPage(name: Routes.home, page: ()=>Home()),
        GetPage(name: Routes.signup, page: ()=>SignUp())
      ],
    );
  }
}
