import 'package:get/get.dart';

class Globalcontroller extends GetxController {
  static Globalcontroller get to => Get.find();

  String profileName='';

  String getName(){
    return this.profileName;
  }
  void setName(String name){
    this.profileName=name;
  }
}
