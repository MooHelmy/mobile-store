import 'package:elkhwaga_stor/Data/models/maintenacemodel.dart';
import 'package:elkhwaga_stor/core/widget/Custom_search.dart';
import 'package:elkhwaga_stor/cubit/Maintenace/maintanece_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../../../core/utils/size_config.dart';
import '../../../../../../../core/widget/custom_item.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../maintenace/view_maintenace/viewmaintenace.dart';

class Editmaintanec_Body extends StatefulWidget {
  const Editmaintanec_Body({super.key});

  @override
  State<Editmaintanec_Body> createState() => _Editmaintanec_BodyState();
}

class _Editmaintanec_BodyState extends State<Editmaintanec_Body> {
  List<Maintenacemodel> lis_proudct = [];
  List<Maintenacemodel> serachproudct = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaintenaceCubit, MaintenaceState>(
      listener: (BuildContext context, state) {
        if (state is LoadMaintanecesuccess) {
          lis_proudct = state.maintenacelist;
        }
      },
      builder: (BuildContext context, Object? state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              customSearch(
                onChanged: (data) {
                  serachproudct.clear();
                  for (var name in lis_proudct) {
                    if (name.clientName
                        .toLowerCase()
                        .contains(data.toLowerCase())) {
                      setState(() {
                        serachproudct.add(name);
                      });
                    }
                  }
                },
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: serachproudct.isEmpty
                      ? lis_proudct.length
                      : serachproudct.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: SizeConfig.defaultSize! * 4),
                  itemBuilder: (context, index) {
                    return custom_item(
                      maintenace: serachproudct.isEmpty
                          ? lis_proudct[index]
                          : serachproudct[index],
                      icon: Icons.delete,
                      onpressed: () {
                        BlocProvider.of<MaintenaceCubit>(context)
                            .deleteitem(id: lis_proudct[index].doc_id);
                        BlocProvider.of<MaintenaceCubit>(context)
                            .loadMaintenace();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(S.of(context).itemdelete)));
                      },
                      ontap: () {
                        Get.to(() => const maintenace_view(),
                            arguments: lis_proudct[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
