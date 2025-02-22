import 'package:flutter/material.dart';

import '../constants/color.dart'; // تأكد من استيراد ملف الألوان حيث يوجد RmainColor

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    this.controller,
    this.onchanged,
    this.hintText,
    this.labelText,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconToggle,
    this.prefixIconColor,
    this.onFieldSubmitted,
    this.keyboardType,
    this.focusNode,
  });

  final String? hintText, labelText;
  final Color? prefixIconColor;
  final IconData? suffixIcon, prefixIcon, suffixIconToggle;
  final Function(String)? onchanged;
  final Function(String)? onFieldSubmitted;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: (data) {
        if (data!.isEmpty) return "Field is required";
        return null;
      },
      onChanged: widget.onchanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: rmaincolor)),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: widget.prefixIconColor)
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? widget.suffixIcon : widget.suffixIconToggle,
            color: _obscureText ? rmaincolor : rmaincolor, // تغيير اللون هنا
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
    );
  }
}





// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../constants/color.dart';
// //radwa
// class CustomTextFormField extends StatefulWidget {
//   CustomTextFormField({
//     this.controller,
//     this.onchanged,
//     this.hintText,
//     this.labelText,
//     this.isPassword = false,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.suffixIconToggle,
//     this.prefixIconColor,
//     this.suffixIconColor,
//     this.suffixIconColorToggle,
//     this.onSuffixIconPressed,
//     this.onFieldSubmitted,
//     this.keyboardType,
//     this.focusNode,
//   });
//
//   final String? hintText, labelText;
//   final Color? prefixIconColor, suffixIconColor, suffixIconColorToggle;
//   final IconData? suffixIcon, prefixIcon, suffixIconToggle;
//   final Function(String)? onchanged;
//   final Function(String)? onFieldSubmitted;
//   final bool isPassword;
//   final TextEditingController? controller;
//   final VoidCallback? onSuffixIconPressed;
//   final TextInputType? keyboardType;
//   final FocusNode? focusNode;
//
//   @override
//   _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
// }
//
// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   late bool _obscureText;
//
//   @override
//   void initState() {
//     super.initState();
//     _obscureText = widget.isPassword;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//      // obscureText: _obscureText,
//       obscureText: widget.isPassword!,
//       validator: (data) {
//         if (data!.isEmpty) return "Field is required";
//         return null;
//       },
//       onChanged: widget.onchanged,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         labelText: widget.labelText,
//         hintStyle: TextStyle(color: Colors.grey),
//         border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//         enabledBorder:
//         OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//         focusedBorder:
//         OutlineInputBorder(borderSide: BorderSide(color: defoultColor)),
//         prefixIcon: widget.prefixIcon != null
//             ? Icon(widget.prefixIcon, color: widget.prefixIconColor)
//             : null,
//         suffixIcon: widget.isPassword
//             ? IconButton(
//           icon: Icon(
//             _obscureText ? widget.suffixIcon : widget.suffixIconToggle,
//             color: _obscureText
//                 ? widget.suffixIconColor
//                 : widget.suffixIconColorToggle,
//           ),
//           onPressed: () {
//             setState(() {
//               _obscureText = !_obscureText;
//             });
//             if (widget.onSuffixIconPressed != null) {
//               widget.onSuffixIconPressed!();
//             }
//           },
//         )
//             : widget.suffixIcon != null
//             ? Icon(widget.suffixIcon, color: widget.suffixIconColor)
//             : null,
//       ),
//       keyboardType: widget.keyboardType,
//       focusNode: widget.focusNode,
//     );
//   }
// }
