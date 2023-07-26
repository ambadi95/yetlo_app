import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:yetlo_app/utils/Colors.dart';
import 'package:yetlo_app/widgets/common_button.dart';
import 'package:yetlo_app/widgets/common_text_field.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) =>  Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SizedBox(
          height: 70,
          child: Column(
            children: [
              CommonButton(
                label: 'Login',
                onTap: ()=> controller.navigateToDashBoard(),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                 Container(
                  height: 250,
                   width: double.infinity,
                   decoration:  const BoxDecoration(
                     color: PRIMARY_COLOR,
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(40),
                     child: Container(
                       height: 250,
                       width: double.infinity,
                       decoration: const BoxDecoration(
                           color: Colors.blue
                       ),
                       child:  Padding(
                         padding: const EdgeInsets.all(40),
                         child: Container(
                           height: 250,
                           width: double.infinity,
                           decoration: const BoxDecoration(
                               color: Colors.green
                           ),
                         ),
                       ),
                     ),
                   ),
                ),
                _sizedBox(20),
                const Center(
                  child: Text('Yetlo App', style:  TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.redAccent
                  ),),
                ),
                _sizedBox(20),
                const CommonTextField(
                  label: 'User ID',
                ),
                _sizedBox(10),
                const CommonTextField(
                  label: 'Password',
                  obscureText: true,
                  errorMessage: '',
                ),
                const Text('Forget Password?', style:  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.redAccent
                ),),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }

  Widget _sizedBox(double height){
    return SizedBox(height: height,);
  }
}
