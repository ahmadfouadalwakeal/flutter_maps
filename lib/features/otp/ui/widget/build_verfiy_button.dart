import 'package:flutter/material.dart';
import 'package:flutter_maps/core/constants/styles.dart';

class BuildVerfiyButton extends StatelessWidget {
  const BuildVerfiyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Verify',
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
