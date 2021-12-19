import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_alert/modules/forum/constants/sizes_const.dart';
import 'package:we_alert/modules/home/constants/color_const.dart';

typedef CustomFunctionStringCallback = String? Function(String? data);

class CustomTextField extends StatelessWidget {
  final String hintext;
  final bool? readonly;
  final IconButton? suffixicon;
  final TextEditingController? controller;
  final bool ispassword;
  final String? errortext;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final int? maxlength;
  final int? maxlines;
  final TextInputType? inputType;
  final Function()? onTap;
  final String? prefix;
  final CustomFunctionStringCallback? validatorfunction;
  final CustomFunctionStringCallback? onChanged;
  const CustomTextField(
      {required this.hintext,
      this.onTap,
      this.maxlines,
      this.inputFormatters,
      this.readonly,
      this.suffixicon,
      this.initialValue,
      this.validatorfunction,
      this.errortext,
      this.maxlength,
      this.controller,
      required this.ispassword,
      this.inputType,
      this.prefix,
      this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      key: key,
      readOnly: readonly ?? false,
      onTap: onTap,
      validator: validatorfunction,
      controller: controller,
      maxLength: maxlength,
      maxLines: maxlines ?? 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      style: const TextStyle(
          color: Color(0xff4d4d4d), fontSize: SizesConst.textFieldFontSize),
      decoration: InputDecoration(
        filled: true,
        errorText: errortext,
        suffixIcon: suffixicon,
        hintText: hintext,
        hintStyle: const TextStyle(
            color: Color(0xffa3aab1), fontSize: SizesConst.textFieldFontSize),
        fillColor: ColorConstants.signupTextFieldBackground,
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorConstants.signUpbuttonColor, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        errorStyle:
            const TextStyle(fontSize: SizesConst.textFieldErrorTextFontSize),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorConstants.signupTextFieldInputBorder, width: 2.0),
        ),
      ),
      obscureText: ispassword,
    );
  }
}
