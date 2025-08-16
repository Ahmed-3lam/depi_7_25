import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
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
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(7),
          ),
          child: TextFormField(
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword! ? obscureText : false,
            obscuringCharacter: "*",
            validator: widget.validator,
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
