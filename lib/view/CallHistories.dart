import 'package:flutter/material.dart';

class CallHistories extends StatefulWidget {
  const CallHistories({super.key});

  @override
  State<CallHistories> createState() => _CallHistoriesState();
}

class _CallHistoriesState extends State<CallHistories> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Call history'));
  }
}
