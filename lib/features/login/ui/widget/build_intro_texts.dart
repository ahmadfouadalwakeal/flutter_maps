import 'package:flutter/material.dart';
import 'package:flutter_maps/core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildIntroTexts extends StatelessWidget {
  const BuildIntroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What is your phone number?',
          style: TextStyles.font22BlackBold,
        ),
        SizedBox(height: 18.h),
        Container(
          child: Text(
            'Please enter your phone number to verfiy your account.',
            style: TextStyles.font18BlackNormal,
          ),
        ),
      ],
    );
  }
}
