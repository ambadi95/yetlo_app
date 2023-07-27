
import 'package:flutter/material.dart';
import 'package:yetlo_app/utils/Colors.dart';

import 'normal_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitle;
  final Color? titleFontColor;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? titleFontWeight;
  final TextAlign? textAlign;
  final Color? appBarColor;
  final double? elevation;
  final List<Widget>? actions;
  final Color? backIconColor;
  final double? backIconSize;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  final bool? centerTitle;
  final bool? hideLeading;

  const CustomAppBar(
      {super.key, this.appBarTitle = '',
      this.titleFontColor = Colors.white,
      this.fontFamily,
      this.fontSize,
      this.titleFontWeight = FontWeight.bold,
      this.textAlign = TextAlign.center,
      this.appBarColor = PRIMARY_COLOR,
      this.elevation = 0,
      this.actions,
      this.centerTitle = true,
      this.backIconColor = Colors.white,
      this.backIconSize = 20,
      this.bottom,
      this.leading,
      this.hideLeading = false});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: PRIMARY_COLOR
            ),
      ),
      centerTitle: centerTitle,
      automaticallyImplyLeading: !hideLeading!,
      leading: leading,
      iconTheme: const IconThemeData(
        color: SECONDARYCOLOR, //change your color here
      ),
      title: NormalText(
        text: appBarTitle,
        textAlign: textAlign,
        fontWeight: titleFontWeight,
        fontcolor: titleFontColor,
        fontFamily: fontFamily,
        fontSize: fontSize,
      ),
      backgroundColor: appBarColor,
      elevation: elevation,
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
