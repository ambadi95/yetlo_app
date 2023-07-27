

import 'package:get/get.dart';
import 'package:yetlo_app/screens/edit_screen/edit_controller.dart';
import 'package:yetlo_app/screens/home_screen/home_controller.dart';
import 'package:yetlo_app/screens/login_screen/login_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => EditController());
  }
}