import 'package:elkhwaga_stor/Data/models/productsmodel.dart';
import 'package:elkhwaga_stor/const/constants.dart';
import 'package:elkhwaga_stor/core/utils/size_config.dart';
import 'package:elkhwaga_stor/core/widget/custom_button.dart';
import 'package:elkhwaga_stor/cubit/Serviecs_cubit/serviecs_cubit.dart';
import 'package:elkhwaga_stor/feature/adminHome/admie_service/Products/updateproduct/updateproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../../generated/l10n.dart';

class viewproduct_body extends StatelessWidget {
  const viewproduct_body({super.key, required this.model});
  final productmodel model;
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
              height: SizeConfig.screenHeight! * .5,
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
                      '${S.of(context).Productname} : ${model.name}',
                      style: const TextStyle(
                          fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Text(
                      '${S.of(context).Productprice}   : ${model.price}' r' $',
                      style: const TextStyle(
                          fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Text(
                      '${S.of(context).Productoriginalprice}: ${model.originalprice}'
                      r' $',
                      style: const TextStyle(
                          fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Text(
                      '${S.of(context).Productamount} : ${model.amount}',
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
            bottom: SizeConfig.defaultSize! * 24,
            child: custom_button(
              text: S.of(context).update,
              color: kmainA,
              onTap: () {
                BlocProvider.of<ServiecsCubit>(context).modelproduct = model;
                Get.to(() => const updateproduct());
              },
            )),
        Positioned(
            right: SizeConfig.defaultSize! * 11,
            top: SizeConfig.defaultSize! * 15,
            child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(model.location))),
      ],
    );
  }
}
