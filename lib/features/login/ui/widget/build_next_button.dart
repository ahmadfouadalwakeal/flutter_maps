import 'package:flutter/material.dart';
import 'package:flutter_maps/core/constants/styles.dart';

class BuildNextButton extends StatelessWidget {
  const BuildNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Next',
          style: TextStyles.font16WhiteSemiBold,
        ),
        style: ElevatedButton.styleFrom(
          maximumSize: Size(110, 50),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
