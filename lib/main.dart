import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetlo_app/binding/binding.dart';
import 'package:yetlo_app/screens/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        title: 'Yetlo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
          useMaterial3: true,
        ),
        initialBinding: Binding(),
        home: const LoginScreen(),
      ),
    );
  }
}

