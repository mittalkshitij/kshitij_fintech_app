import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.prefixWidget,
    this.suffixWidget,
    this.validator,
    this.textInputType,
    this.isPassword = false,
    required this.label,
  });

  final TextEditingController controller;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextInputType? textInputType;
  final String label;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool showHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? showHidePassword : false,
      obscuringCharacter: '*',
      controller: widget.controller,
      keyboardType: widget.textInputType,
      validator: widget.validator,
      decoration: InputDecoration(
          prefixIcon: widget.prefixWidget,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showHidePassword = !showHidePassword;
                    });
                  },
                  icon: showHidePassword
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off))
              : widget.suffixWidget,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.green, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.deepPurple, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 2)),
          filled: true,
          fillColor: Colors.white,
          label: Text(widget.label),
          floatingLabelAlignment: FloatingLabelAlignment.center),
      // onChanged: (value) {
      //   log(value);
      // },
    );
  }
}
