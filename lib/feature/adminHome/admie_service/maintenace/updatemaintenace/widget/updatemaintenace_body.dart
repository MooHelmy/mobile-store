import 'package:elkhwaga_stor/Data/models/maintenacemodel.dart';
import 'package:elkhwaga_stor/const/constants.dart';
import 'package:elkhwaga_stor/cubit/Maintenace/maintanece_cubit.dart';
import 'package:elkhwaga_stor/feature/adminHome/admie_service/maintenace/Editmaintenace/Editmaintenace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widget/Custmtext.dart';
import '../../../../../../core/widget/custom_button.dart';
import '../../../../../../generated/l10n.dart';

class updatemaintenace_body extends StatelessWidget {
  const updatemaintenace_body({
    super.key,
    required this.model,
  });
  final Maintenacemodel model;
  @override
  Widget build(BuildContext context) {
    String? clientName, price, problemName, enddate, paidup;
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 20),
      child: BlocConsumer<MaintenaceCubit, MaintenaceState>(
        listener: (context, state) {
          if (state is UpdateMaintanecesuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).itemupdate)));
            Get.to(() => const Editmaintanec());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Cusomtext(
                  hinttext: S.of(context).Clientname,
                  onChanged: (value) {
                    clientName = value;
                  },
                ),
                Cusomtext(
                  hinttext: S.of(context).problemname,
                  onChanged: (value) {
                    problemName = value;
                  },
                ),
                Cusomtext(
                  hinttext: S.of(context).price,
                  onChanged: (value) {
                    price = value;
                  },
                ),
                Cusomtext(
                  hinttext: S.of(context).enddate,
                  onChanged: (value) {
                    enddate = value;
                  },
                ),
                Cusomtext(
                  hinttext: S.of(context).paidup,
                  onChanged: (value) {
                    paidup = value;
                  },
                ),
                SizedBox(
                  height: SizeConfig.defaultSize! * 3,
                ),
                custom_button(
                  text: S.of(context).update,
                  color: kmainA,
                  onTap: () {
                    Maintenacemodel mmodel = Maintenacemodel(
                      clientName:
                          clientName == null ? model.clientName : clientName!,
                      price: price == null ? model.price : price!,
                      problemName: problemName == null
                          ? model.problemName
                          : problemName!,
                      startdate: model.startdate,
                      enddate: enddate == null ? model.enddate : enddate!,
                      paidup: paidup == null ? model.paidup : paidup!,
                    );
                    BlocProvider.of<MaintenaceCubit>(context).updateMaintenace(
                        id: model.doc_id, Maintenacemodel: mmodel);
                    BlocProvider.of<MaintenaceCubit>(context).loadMaintenace();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
