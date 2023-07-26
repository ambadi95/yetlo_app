

import 'package:get/get.dart';
import 'package:yetlo_app/screens/home_screen/home_controller.dart';
import 'package:yetlo_app/screens/home_screen/home_screen.dart';

class LoginController extends GetxController {

  navigateToDashBoard(){

    Get.off(()=> const HomeScreen(),binding: BindingsBuilder.put(() => HomeController()));

  }

}