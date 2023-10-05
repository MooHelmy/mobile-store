import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class custompage_item extends StatelessWidget {
  const custompage_item(
      {super.key,
      required this.imagename,
      required this.subtitle,
      required this.title});
  final String imagename, subtitle, title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 15, right: 10, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagename,
              height: 290,
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 2,
            ),
            Text(
              title,
              style: const TextStyle(fontFamily: 'Pacifico', fontSize: 20),
            ),
            SizedBox(
              height: SizeConfig.defaultSize,
            ),
            Text(
              subtitle,
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 15,
                  color: Colors.black.withOpacity(.2)),
            ),
          ],
        ),
      ),
    );
  }
}
