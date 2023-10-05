import 'package:elkhwaga_stor/Data/models/maintenacemodel.dart';
import 'package:elkhwaga_stor/cubit/Maintenace/maintanece_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../const/constants.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widget/Custmtextfield.dart';
import '../../../../../../core/widget/custom_button.dart';
import '../../../../../../generated/l10n.dart';

class Maintenace_body extends StatefulWidget {
  const Maintenace_body({super.key});

  @override
  State<Maintenace_body> createState() => _Maintenace_bodyState();
}

class _Maintenace_bodyState extends State<Maintenace_body> {
  @override
  Widget build(BuildContext context) {
    String? clientName, price, problemName, enddate, paidup;
    GlobalKey<FormState> formstate = GlobalKey();

    return BlocConsumer<MaintenaceCubit, MaintenaceState>(
      listener: (context, state) {
        if (state is AddMaintanecesuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(S.of(context).itemupdate)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 7),
          child: Form(
            key: formstate,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Custmtextfield(
                    hinttext: S.of(context).Clientname,
                    onSaved: (data) {
                      clientName = data;
                    },
                  ),
                  Custmtextfield(
                    hinttext: S.of(context).problemname,
                    onSaved: (data) {
                      problemName = data;
                    },
                  ),
                  Custmtextfield(
                    hinttext: S.of(context).price,
                    onSaved: (data) {
                      price = data;
                    },
                  ),
                  Custmtextfield(
                    hinttext: S.of(context).enddate,
                    onSaved: (data) {
                      enddate = data;
                    },
                  ),
                  Custmtextfield(
                    hinttext: S.of(context).paidup,
                    onSaved: (data) {
                      paidup = data;
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 3,
                  ),
                  custom_button(
                    isloading: state is Maintaneceloading ? true : false,
                    text: S.of(context).add,
                    color: kmainA,
                    onTap: () {
                      if (formstate.currentState!.validate()) {
                        formstate.currentState!.save();

                        Maintenacemodel model = Maintenacemodel(
                          clientName: clientName!,
                          price: price!,
                          problemName: problemName!,
                          startdate: DateTime.now().toString(),
                          enddate: enddate!,
                          paidup: paidup!,
                        );

                        BlocProvider.of<MaintenaceCubit>(context)
                            .addMaintenace(model);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
