import 'package:flutter/material.dart';
import 'package:halloween/utils/Stack.dart';
import '../view/Member.dart';
import '../utils/ListColor.dart';
import '../app/Route.dart';
import '../view/Media.dart';
import '../view/CallHistories.dart';
import '../http/CallAPI.dart';
import 'package:get/get.dart';

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
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                  final response = await CallAPI.logout(StackMemory.getToken());
                  StackMemory.setToken('');
                  if(response == 1) Get.toNamed(Routes.login);
              },
            ),
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