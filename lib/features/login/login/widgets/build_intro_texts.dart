import 'package:flutter/widgets.dart';
import 'package:flutter_maps/core/constants/styles_colors/styles.dart';

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
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            'Please enter your phone number to verify your account.',
            style: TextStyles.font18BlackNormal,
          ),
        ),
      ],
    );
  }
}
