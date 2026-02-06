import 'package:flutter/material.dart';
import '../utils/Stack.dart';
import '../http/CallAPI.dart';

class Member extends StatefulWidget {
  const Member({super.key});

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Member'));
  }
}
