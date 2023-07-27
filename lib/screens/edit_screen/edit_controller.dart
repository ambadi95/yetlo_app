

import 'dart:convert';
import 'package:dio/src/form_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import 'package:yetlo_app/screens/edit_screen/profile_model.dart';
import '../../utils/Colors.dart';
import '../../utils/api_service.dart';
import '../../utils/common.dart';
import 'model.dart';
import 'package:dio/src/form_data.dart' as form;

class EditController extends GetxController {

  navigateToDashBoard(){

  }

  int currentIndex = 0;

  FrameListResponse? frameListResponse;

  Future getFrameList(BuildContext context) async {
    var formData = form.FormData.fromMap({
      'customer_id': customerId,
      'token': token,
    });

    var response = await apiService(context, 'customer_select_frameslist', formData);
    if (response.statusCode == 200) {
      frameListResponse = FrameListResponse.fromMap(json.decode(response.toString()) );
      update();
    } else {
      Toast.show(response.data['error'],
          duration: Toast.lengthShort,
          gravity: Toast.top,
          backgroundColor: RED);
    }
  }

  ProfileResponse? profileResponse;

  Future getProfile(BuildContext context) async {
    var formData = form.FormData.fromMap({
      'customer_id': customerId,
      'token': token,
    });

    var response = await apiService(context, 'getprofile', formData);
    if (response.statusCode == 200) {
      profileResponse = ProfileResponse.fromMap(json.decode(response.toString()) );
      update();
    } else {
      Toast.show(response.data['error'],
          duration: Toast.lengthShort,
          gravity: Toast.top,
          backgroundColor: RED);
    }
  }

}