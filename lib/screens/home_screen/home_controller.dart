

import 'dart:convert';
import 'package:dio/src/form_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import '../../utils/Colors.dart';
import '../../utils/api_service.dart';
import 'model.dart';
import 'package:dio/src/form_data.dart' as form;

class HomeController extends GetxController {

  navigateToDashBoard(){

  }

  SubCategoryResponse? subCategoryResponse;

  Future getSubCategories(BuildContext context) async {
    var formData = form.FormData.fromMap({
      'customer_id': '70',
      'token': '27f2ac-7423b6-403f6d-44aec7-0c319c',
      'style' : 'style_6',
      'section_id' : '6'
    });

    var response = await apiService(context, 'sub_categories', formData);
    if (response.statusCode == 200) {
      subCategoryResponse = SubCategoryResponse.fromMap(json.decode(response.toString()) );
    } else {
      Toast.show(response.data['error'],
          duration: Toast.lengthShort,
          gravity: Toast.top,
          backgroundColor: RED);
    }
  }

}