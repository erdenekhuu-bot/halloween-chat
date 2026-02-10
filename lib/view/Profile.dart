import 'package:flutter/material.dart';
import 'package:halloween/utils/ListColor.dart';
import 'package:halloween/app/GlobalController.dart';
import 'package:halloween/app/Route.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Globalcontroller globalcontroller = Get.put(Globalcontroller.to);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Listcolor.backgroundColor,
        iconTheme: const IconThemeData(color: Listcolor.textWhite),
        foregroundColor: Listcolor.textWhite,
        title: Text('${globalcontroller.getName()}',style: TextStyle(color: Listcolor.textWhite)),
      ),
      body: Center(child: Text('Chat screen')),
    );
  }
}
