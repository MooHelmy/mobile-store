import 'package:elkhwaga_stor/feature/Userhome/Userhome_body.dart';
import 'package:flutter/material.dart';

import '../../const/constants.dart';
import '../../core/utils/size_config.dart';

class Userhome extends StatelessWidget {
  const Userhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.defaultSize! * 5, left: 8, right: 8),
        child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: kcolorp),
            child: const Userhome_body()),
      ),
    );
  }
}
