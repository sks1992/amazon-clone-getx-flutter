import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.leading,
    this.color,
  }) : super(key: key);

// required Auth value,   required Auth? groupValue,   required void Function(Auth?)? onChanged
  final String title;
  final Widget leading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: color,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: leading,
    );
  }
}
