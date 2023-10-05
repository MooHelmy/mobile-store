import 'package:elkhwaga_stor/core/widget/Custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../Data/models/productsmodel.dart';
import '../../core/utils/size_config.dart';
import '../../core/widget/custom_item.dart';
import '../../cubit/Serviecs_cubit/serviecs_cubit.dart';
import '../../generated/l10n.dart';
import '../adminHome/admi_auth/login/loginPage.dart';

class Userhome_body extends StatefulWidget {
  const Userhome_body({super.key});

  @override
  State<Userhome_body> createState() => _Userhome_bodyState();
}

class _Userhome_bodyState extends State<Userhome_body> {
  List<productmodel> lisproudct = [];
  List<productmodel> serachproudct = [];
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiecsCubit, ServiecsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return state is Getproudctsuccess
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    customSearch(
                      onTap: () {
                        Get.to(() => const loginPage());
                      },
                      text: S.of(context).Admin,
                      onChanged: (data) {
                        lisproudct = state.listproduct;
                        serachproudct.clear();
                        for (var pro in lisproudct) {
                          if (pro.name
                              .toLowerCase()
                              .contains(data.toLowerCase())) {
                            setState(() {
                              serachproudct.add(pro);
                            });
                          }
                        }
                      },
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: serachproudct.isEmpty
                            ? state.listproduct.length
                            : serachproudct.length,
                        clipBehavior: Clip.none,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: SizeConfig.defaultSize! * 4),
                        itemBuilder: (context, index) {
                          return custom_item(
                            product: serachproudct.isEmpty
                                ? state.listproduct[index]
                                : serachproudct[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
