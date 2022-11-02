import 'package:amazon_clone_getx/core/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final int maxLines;

  final String? initialValue;

  //final int maxLength;
  final TextInputType inputType;
  final String prefix;
  final String title;
  final String? hint;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onSubmit;
  final bool obscureText;
  final bool enabled;
  final bool textRequired;
  final bool requiredFieldSymbol;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    Key? key,
    this.initialValue,
    this.maxLines = 1,
    // this.maxLength = 100,
    this.inputType = TextInputType.text,
    this.prefix = "",
    this.inputFormatter,
    this.controller,
    this.focusNode,
    this.onSubmit,
    this.obscureText = false,
    this.enabled = true,
    this.textRequired = true,
    this.title = "",
    this.hint,
    this.requiredFieldSymbol = false,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textRequired
            ? RichText(
                text: TextSpan(
                  text: title,
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                  children: [
                    requiredFieldSymbol
                        ? const TextSpan(
                            text: ' *',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold))
                        : const TextSpan(text: ""),
                  ],
                ),
              )
            : const SizedBox(
                height: 0,
              ),
        const SizedBox(height: 4),
        TextFormField(
          validator: (val) {},
          initialValue: initialValue,
          enabled: enabled,
          obscureText: obscureText,
          autofocus: false,
          autocorrect: false,
          enableSuggestions: false,
          maxLines: maxLines,
          //  maxLength: maxLength > 0 ? maxLength : null,
          keyboardType: inputType,
          inputFormatters: inputFormatter,
          cursorColor: Colors.red,
          //colorRed,
          textInputAction: textInputAction,
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted: onSubmit,
          decoration: InputDecoration(
            hintText: hint,
            isDense: true,
            prefix: Text(prefix),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: GlobalVariables.secondaryColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
            ),
            filled: !enabled,
            fillColor: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
