import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isBorderContainer;
  final TextEditingController controller;
  final void Function(String?)? onSaved;

  const CustomTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.isBorderContainer = false,
    required this.controller,
    this.onSaved,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    print("build from custom password field");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          widget.label,
          style: TextStyle(color: Color(0xFF8B8B97), fontSize: 14),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: widget.isBorderContainer ? null : Colors.grey[100],
            borderRadius: BorderRadius.circular(7),
            border: widget.isBorderContainer
                ? Border.all(color: Colors.grey.withOpacity(.2))
                : null,
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword! ? obscureText : false,
            obscuringCharacter: "*",
            validator: widget.validator,
            onFieldSubmitted: widget.onSaved,
            decoration: InputDecoration(
              suffixIcon: !widget.isPassword!
                  ? null
                  : InkWell(
                      onTap: () {
                        obscureText = !obscureText;
                        setState(() {});
                      },
                      child: Icon(
                        obscureText
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                      ),
                    ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
