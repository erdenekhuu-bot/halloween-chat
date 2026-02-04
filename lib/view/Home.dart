import 'package:flutter/material.dart';
import '../view/Member.dart';
import '../utils/ListColor.dart';
import '../view/Media.dart';
import '../view/CallHistories.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Listcolor.backgroundColor,
            iconTheme: const IconThemeData(color: Listcolor.textWhite),
            foregroundColor: Listcolor.textWhite,
            bottom: const TabBar(
              tabs: [
                Tab(child: Text('Members',style: TextStyle(color: Listcolor.textWhite))),
                Tab(icon: Text('Media',style: TextStyle(color: Listcolor.textWhite))),
                Tab(icon: Text('Call history',style: TextStyle(color: Listcolor.textWhite))),
              ],
            ),
            title: Text('CHATROOM FREE', style: TextStyle(color: Listcolor.textWhite)),
          ),
          body: TabBarView(
            children: [
              Member(),
              Media(),
              CallHistories(),
            ],
          ),
        ),
    );
  }
}