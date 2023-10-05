import 'package:elkhwaga_stor/core/utils/size_config.dart';
import 'package:elkhwaga_stor/cubit/Serviecs_cubit/serviecs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../const/constants.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../EditProduct/EditProduct.dart';
import '../addProudct/addProduct.dart';

class Products_body extends StatelessWidget {
  const Products_body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          custom_button(
            text: S.of(context).addproudct,
            color: kmainA,
            onTap: () {
              Get.to(() => const Addproduct());
            },
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          custom_button(
            text: S.of(context).EditProudct,
            color: kmainA,
            onTap: () {
              BlocProvider.of<ServiecsCubit>(context).loadProduct();
              Get.to(() => const EditProduct());
            },
          )
        ],
      ),
    );
  }
}
