import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {@required this.controller,
      this.margin,
      this.textInputAction,
      this.focusNode,
      this.onChanged,
      this.obsecureText = false,
      this.onTap,
      this.onSubmitted,
      this.validator,
      this.keyBoardType,
      this.errorText,
      this.readOnly = false,
      this.hintText})
      : assert(controller != null);
  final TextEditingController controller;
  final EdgeInsetsGeometry margin;
  final TextInputAction textInputAction;
  final String hintText;
  final FocusNode focusNode;
  final bool obsecureText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final Function(String) validator;
  final Function onTap;
  final TextInputType keyBoardType;
  final String errorText;

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        readOnly: readOnly,
        textInputAction: textInputAction,
        obscureText: obsecureText,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        cursorHeight: 16,
        validator: validator,
        maxLines: 1,
        onTap: onTap,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          isDense: true,
          contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
          errorText: errorText,
          errorStyle: TextStyle(fontSize: 13),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          // errorBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.red, width: 1),
          //   borderRadius: BorderRadius.circular(5),
          // ),
        ),
      ),
    );
  }
}
