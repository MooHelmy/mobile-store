import 'package:elkhwaga_stor/Data/models/productsmodel.dart';
import 'package:elkhwaga_stor/core/widget/Custom_search.dart';
import 'package:elkhwaga_stor/cubit/Serviecs_cubit/serviecs_cubit.dart';
import 'package:elkhwaga_stor/feature/adminHome/admie_service/Products/view_product/viewproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widget/custom_item.dart';
import '../../../../../../generated/l10n.dart';

class EditProduct_Body extends StatefulWidget {
  const EditProduct_Body({super.key});

  @override
  State<EditProduct_Body> createState() => _EditProduct_BodyState();
}

class _EditProduct_BodyState extends State<EditProduct_Body> {
  List<productmodel> lis_proudct = [];
  List<productmodel> serachproudct = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiecsCubit, ServiecsState>(
      listener: (BuildContext context, state) {
        if (state is Getproudctsuccess) {
          lis_proudct = state.listproduct;
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
                  for (var pro in lis_proudct) {
                    if (pro.name.toLowerCase().contains(data.toLowerCase())) {
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
                      product: serachproudct.isEmpty
                          ? lis_proudct[index]
                          : serachproudct[index],
                      icon: Icons.delete,
                      onpressed: () {
                        BlocProvider.of<ServiecsCubit>(context)
                            .deleteproduct(lis_proudct[index].DocId);
                        BlocProvider.of<ServiecsCubit>(context).loadProduct();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(S.of(context).itemdelete)));
                      },
                      ontap: () {
                        Get.to(() => const viewproduct(),
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
