import 'package:flutter/material.dart';

bool see = false;
class CustomTextFieldWidget extends StatefulWidget {
  final controller;
  final text;
  final password;
  var onChange;
  CustomTextFieldWidget({super.key,required this.controller, required this.text, required this.password, this.onChange});

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
         controller: widget.controller,
      onChanged: widget.onChange,
      decoration: InputDecoration(

        hintStyle: TextStyle(
          color: const Color(
            0xFFCBCBCB,
          ),
        ),
        hintText: widget.text,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),

      ),

    );
  }
}
