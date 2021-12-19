import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:we_alert/modules/forum/constants/sizes_const.dart';
import 'package:we_alert/modules/home/constants/color_const.dart';

class CustomSignUpButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color buttoncolor;
  final Color bordercolor;
  final bool? isloading;
  const CustomSignUpButton(
      {required this.buttoncolor,
      required this.bordercolor,
      required this.title,
      required this.onPressed,
      this.isloading,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(1.0),
            backgroundColor: MaterialStateProperty.all<Color>(buttoncolor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(color: bordercolor, width: 2.5)))),
        onPressed: onPressed,
        child: SizedBox(
          height: SizesConst.customSignUpBtnHeight,
          child: Center(
            child: (isloading != null && isloading == true)
                ? Lottie.asset('assets/animations/btnanimation.json')
                : Text(
                    title,
                    style: TextStyle(
                        fontSize: SizesConst.customSignUpTextSize,
                        color: buttoncolor == ColorConstants.scaffoldBgColour
                            ? const Color(0xff84bbaa)
                            : const Color(0xfff1f7f5)),
                  ),
          ),
        ));
  }
}
