import 'package:elkhwaga_stor/Data/models/maintenacemodel.dart';
import 'package:elkhwaga_stor/const/constants.dart';
import 'package:elkhwaga_stor/core/utils/size_config.dart';
import 'package:elkhwaga_stor/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../generated/l10n.dart';
import '../../updatemaintenace/updatemaintenace.dart';

class maintenace_body extends StatelessWidget {
  const maintenace_body({super.key, required this.model});

  final Maintenacemodel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: Center(
            child: Container(
              width: SizeConfig.screenWidth! * .8,
              height: SizeConfig.screenHeight! * .7,
              decoration: BoxDecoration(
                  color: kcolorp, borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.defaultSize! * 4,
                    ),
                    Text(
                      '${S.of(context).Clientname}   : ${model.clientName}',
                      style: const TextStyle(
                          fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Text(
                      '${S.of(context).problemname}    : ${model.problemName}',
                      style: const TextStyle(
                          fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Text(
                      '${S.of(context).price} : ${model.price}' r' $',
                      style: const TextStyle(
                          fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Text(
                      ' ${S.of(context).paidup} : ${model.paidup}' r' $',
                      style: const TextStyle(
                          fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Text(
                      '${S.of(context).startdate} : ${model.startdate}',
                      style: const TextStyle(
                          fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Text(
                      '${S.of(context).enddate} : ${model.enddate}',
                      style: const TextStyle(
                          fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            left: SizeConfig.defaultSize! * 8,
            right: SizeConfig.defaultSize! * 8,
            bottom: SizeConfig.defaultSize! * 20,
            child: custom_button(
              text: ' ${S.of(context).update} ',
              color: kmainA,
              onTap: () {
                Get.to(() => const updatemaintenace(), arguments: model);
              },
            )),
        Positioned(
            right: SizeConfig.defaultSize! * 11,
            top: SizeConfig.defaultSize! * 7,
            child: const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/6009/6009864.png'))),
      ],
    );
  }
}
