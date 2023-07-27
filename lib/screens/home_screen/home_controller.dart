

import 'dart:convert';
import 'package:dio/src/form_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import 'package:yetlo_app/screens/edit_screen/edit_controller.dart';
import 'package:yetlo_app/screens/edit_screen/edit_screen.dart';
import '../../utils/Colors.dart';
import '../../utils/api_service.dart';
import '../../utils/common.dart';
import 'model.dart';
import 'package:dio/src/form_data.dart' as form;

class HomeController extends GetxController {
  SubCategoryResponse? subCategoryResponse;

  navigateToEditScreen(Re? res){
    Get.to(()=> EditScreen(res: res!),binding: BindingsBuilder.put(() => EditController()));
  }



  Future getSubCategories(BuildContext context) async {
    var formData = form.FormData.fromMap({
      'customer_id': customerId,
      'token': token,
      'style' : 'style_6',
      'section_id' : '6'
    });

    var response = await apiService(context, 'sub_categories', formData);
    if (response.statusCode == 200) {
      subCategoryResponse = SubCategoryResponse.fromMap(json.decode(response.toString()) );
      update();
    } else {
      Toast.show(response.data['error'],
          duration: Toast.lengthShort,
          gravity: Toast.top,
          backgroundColor: RED);
    }
  }

}