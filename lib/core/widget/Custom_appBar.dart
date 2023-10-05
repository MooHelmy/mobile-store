import 'package:flutter/material.dart';

import '../../app_images.dart';
import '../utils/size_config.dart';

class custom_appBar extends StatelessWidget {
  const custom_appBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: SizeConfig.defaultSize! * 5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: SizeConfig.defaultSize! / 2,
              ),
              Container(
                  height: SizeConfig.defaultSize! * 4,
                  width: SizeConfig.defaultSize! * 4,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(Assets.imagesMaintenace1),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
