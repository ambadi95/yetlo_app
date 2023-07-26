import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:yetlo_app/utils/Colors.dart';
import 'package:yetlo_app/widgets/common_button.dart';
import 'package:yetlo_app/widgets/common_text_field.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        didChangeDependencies: (data) {
          data.controller?.getSubCategories(context);
        },
        builder: (controller) => Scaffold(
              body: ListView.builder(
                  itemCount: controller.subCategoryResponse?.res?.length,
                  itemBuilder: (BuildContext context, index) {
                    return Text('Text');
                  }),
            ));
  }

  Widget _sizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
