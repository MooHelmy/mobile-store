import 'package:elkhwaga_stor/cubit/auth/auth_cubit/authcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../app_images.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/Custmtextfield.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../admin_main/admin_main.dart';
import '../../signin/signin.dart';

class loginpage_body extends StatefulWidget {
  const loginpage_body({super.key});

  @override
  State<loginpage_body> createState() => _loginpage_bodyState();
}

class _loginpage_bodyState extends State<loginpage_body> {
  String? email, password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is Loginfailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is LoginSuccess) {
          Get.to(
            () => const admin_main(),
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Success')));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formstate,
            child: Column(
              children: [
                Container(
                  height: SizeConfig.defaultSize! * 50,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.defaultSize! * 10,
                      ),
                      const Text(
                        'Hello!',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Image.asset(Assets.imagesViewImageLogo),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize! * 2,
                ),
                Custmtextfield(
                  hinttext: S.of(context).enteremail,
                  onSaved: (data) {
                    email = data;
                  },
                  icon: Icons.email,
                ),
                Custmtextfield(
                  hinttext: S.of(context).enterpassword,
                  icon: Icons.lock,
                  onSaved: (data) {
                    password = data;
                  },
                ),
                SizedBox(
                  height: SizeConfig.defaultSize,
                ),
                custom_button(
                  isloading: state is LoginLoading ? true : false,
                  text: S.of(context).login,
                  color: Colors.blue,
                  onTap: () {
                    if (formstate.currentState!.validate()) {
                      formstate.currentState!.save();
                      BlocProvider.of<AuthCubit>(context)
                          .login(email: email!, password: password!);
                    }
                  },
                ),
                SizedBox(
                  height: SizeConfig.defaultSize! * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).noaccount),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Sigin());
                      },
                      child: Text(
                        S.of(context).registar,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
