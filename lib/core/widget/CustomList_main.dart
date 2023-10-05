import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class customlist_main extends StatelessWidget {
  const customlist_main(
      {super.key, required this.name, this.onTap, required this.assetName});
  final void Function()? onTap;
  final String name, assetName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Stack(children: [
          Positioned(
            right: SizeConfig.defaultSize! * 2,
            top: SizeConfig.defaultSize! * 3,
            child: Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Positioned(
              left: SizeConfig.defaultSize! * 2,
              bottom: SizeConfig.defaultSize,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(assetName),
              ))
        ]),
      ),
    );
  }
}
