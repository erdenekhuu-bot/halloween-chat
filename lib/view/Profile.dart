import 'package:flutter/material.dart';
import 'package:halloween/utils/ListColor.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Listcolor.backgroundColor,
        iconTheme: const IconThemeData(color: Listcolor.textWhite),
        foregroundColor: Listcolor.textWhite,
        title: Text('PROFILE',style: TextStyle(color: Listcolor.textWhite)),
      ),
      body: Column(
        children: [
          Text('123')
        ],
      ),
    );
  }
}
