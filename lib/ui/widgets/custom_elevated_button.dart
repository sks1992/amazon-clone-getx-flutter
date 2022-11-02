import 'package:flutter/material.dart';

import '../../core/constants/global_variables.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key, required this.text, required this.onTap})
      : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50), backgroundColor: GlobalVariables.secondaryColor,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,fontSize: 18
        ),
      ),
    );
  }
}
