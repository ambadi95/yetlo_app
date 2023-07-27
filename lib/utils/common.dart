

import 'package:flutter/material.dart';


const customerId = "70";
const token ="27f2ac-7423b6-403f6d-44aec7-0c319c";

Color dynamicColor(String? hexColor){
   final buffer = StringBuffer();
   if (hexColor?.length == 6 || hexColor?.length == 7) buffer.write('ff');
   buffer.write(hexColor?.replaceFirst('#', ''));
   return Color(int.parse(buffer.toString(), radix: 16));
}