import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class custom_button extends StatelessWidget {
  const custom_button(
      {super.key,
      required this.text,
      this.onTap,
      this.color,
      this.isloading = false});
  final Function()? onTap;
  final String text;
  final Color? color;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.defaultSize! * 5,
        width: SizeConfig.defaultSize! * 20,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: isloading
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
