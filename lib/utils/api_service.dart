import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:toast/toast.dart';
import 'package:yetlo_app/utils/Colors.dart';
import 'package:yetlo_app/utils/api_config.dart';

import 'enums.dart';

Future<Response> apiService(BuildContext context,String url,params, { method = Method.POST} ) async {
  String baseUrl = apiConfig.getBaseApi();
  String jwt = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTUyNzI4NzMsImlzcyI6IllqRzhMdjE5TDBVclRSZmFXc3NoT0k2aXJrTGpzMWtSIiwic3ViIjoiTXV2aWVyZWNrIEF1dGhlbnRpY2F0aW9uIn0.XMiCPoVEJa0WJiDy3NuFkTXUdFyxEonEvVpkDONMr4s';
  ToastContext().init(context);
  OverlayEntry loading = OverlayEntry(
      builder: (context) => AbsorbPointer(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: const SpinKitRing(color: PRIMARY_COLOR, size: 50.0),
        ),
      ));
  WidgetsBinding.instance
      .addPostFrameCallback((_) => Overlay.of(context)!.insert(loading));
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestBody: true,
    requestHeader: true
  ));
  late Map<String, String> auth = {"Authorization" :  'Bearer $jwt'};
  try {
    switch(method){
      case Method.POST : Response response = await dio.post("$baseUrl$url",
          options: Options(
              headers: auth
          ),
          data: params);
      loading.remove();
      return response;
      case Method.GET :
        Response response = await dio.get("$baseUrl$url",
            options: Options(
                headers: auth
            ),
            data: params);
        loading.remove();
        return response;
      case Method.PUT :
        Response response = await dio.put("$baseUrl$url",
            options: Options(
                headers: auth
            ),
            data: jsonEncode(params));
        loading.remove();
        return response;
    }


  }catch (e){
    if (kDebugMode) {
      print(e.toString());
    }
    loading.remove();
    Toast.show("Something went Wrong",
        duration: Toast.lengthShort,
        gravity: Toast.top,
        backgroundColor: Colors.red);
  }
  throw {
  // ignore: avoid_print
  print('error')
  };
}
