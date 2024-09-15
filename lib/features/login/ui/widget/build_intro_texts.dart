import 'package:flutter/material.dart';
import 'package:flutter_maps/core/constants/styles.dart';

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
        SizedBox(),
        Container(
          child: Text(
            'Please enter your phone number to verfiy your account.',
            style: TextStyles.font18BlackBold,
          ),
        ),
      ],
    );
  }
}
