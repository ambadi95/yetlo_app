import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String errorMessage;
  const CommonTextField(
      {super.key,
      this.controller,
      this.label,
      this.obscureText = false,
      this.errorMessage = '',
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: errorMessage != '' ? Colors.red : Colors.grey,
              )),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
                hintText: label,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 15, right: 15),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Text(errorMessage,
        style: const TextStyle(
          color: Colors.red
        ),)
      ],
    );
  }
}
