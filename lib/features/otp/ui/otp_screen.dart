import 'package:flutter/material.dart';
import 'package:flutter_maps/features/otp/ui/widget/build_otp_intro_text.dart';
import 'package:flutter_maps/features/otp/ui/widget/build_pin_code_fields.dart';
import 'package:flutter_maps/features/otp/ui/widget/build_verfiy_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 64.h),
        child: Column(
          children: [
            BuildOtpIntroText(),
            SizedBox(
              height: 70.h,
            ),
            BuildPinCodeFields(),
            SizedBox(
              height: 70.h,
            ),
            BuildVerfiyButton(),
          ],
        ),
      ),
    ));
  }
}
