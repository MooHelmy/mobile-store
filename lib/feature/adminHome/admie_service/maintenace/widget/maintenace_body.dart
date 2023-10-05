import 'package:elkhwaga_stor/cubit/Maintenace/maintanece_cubit.dart';
import 'package:elkhwaga_stor/feature/adminHome/admie_service/maintenace/Editmaintenace/Editmaintenace.dart';
import 'package:elkhwaga_stor/feature/adminHome/admie_service/maintenace/addmaintenace/addmaintenace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../const/constants.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../generated/l10n.dart';

class maintenace_body extends StatelessWidget {
  const maintenace_body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          custom_button(
            text: S.of(context).addproblem,
            color: kmainA,
            onTap: () {
              Get.to(() => const Addmaintanec());
            },
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          custom_button(
            text: S.of(context).Editproblem,
            color: kmainA,
            onTap: () {
              BlocProvider.of<MaintenaceCubit>(context).loadMaintenace();
              Get.to(() => const Editmaintanec());
            },
          )
        ],
      ),
    );
  }
}
