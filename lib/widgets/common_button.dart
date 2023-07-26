import 'package:flutter/material.dart';
import 'package:yetlo_app/utils/Colors.dart';

class CommonButton extends StatelessWidget {
  String label;
  Function()? onTap;
   CommonButton({super.key, this.label = "CLick Here", this.onTap});


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration:  BoxDecoration(
          color: PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child:
          Text(label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white
            ),
          )),
        ),
      ),
    );
  }
}
