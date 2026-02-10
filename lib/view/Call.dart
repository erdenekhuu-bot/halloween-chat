import 'package:flutter/material.dart';
import 'package:halloween/utils/ListColor.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Listcolor.backgroundColor,
        iconTheme: const IconThemeData(color: Listcolor.textWhite),
        foregroundColor: Listcolor.textWhite,
        title: Text('PROFILE',style: TextStyle(color: Listcolor.textWhite)),
      ),
    );
  }
}
