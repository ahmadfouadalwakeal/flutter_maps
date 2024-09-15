import 'package:flutter/material.dart';
import 'package:flutter_maps/core/constants/my_colors.dart';
import 'package:flutter_maps/core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BuildOtpIntroText extends StatelessWidget {
  BuildOtpIntroText({super.key});
  final phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verify your phone number',
          style: TextStyles.font22BlackBold,
        ),
        SizedBox(
          height: 18.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: RichText(
              text: TextSpan(
                  text: 'Enter your 6 digit code numbers sent to ',
                  style: TextStyles.font18BlackNormal.copyWith(height: 1.4),
                  children: <TextSpan>[
                TextSpan(
                  text: phoneNumber,
                  style: TextStyle(color: MyColors.blue),
                )
              ])),
        ),
      ],
    );
  }
}
