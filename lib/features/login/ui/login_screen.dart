import 'package:flutter/material.dart';
import 'package:flutter_maps/features/login/ui/widget/build_intro_texts.dart';
import 'package:flutter_maps/features/login/ui/widget/build_next_button.dart';
import 'package:flutter_maps/features/login/ui/widget/build_phone_from_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _phoneFormKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 64.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildIntroTexts(),
                SizedBox(
                  height: 70.h,
                ),
                BuildPhoneFromField(),
                SizedBox(
                  height: 70.h,
                ),
                BuildNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
