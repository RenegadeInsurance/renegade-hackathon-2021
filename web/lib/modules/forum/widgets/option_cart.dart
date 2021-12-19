import 'package:flutter/material.dart';
import 'package:we_alert/modules/home/constants/color_const.dart';

class OptionCart extends StatelessWidget {
  const OptionCart({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                border: Border.all(
                    color:
                        isSelected ? Colors.blue : ColorConstants.lightishText,
                    width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.circle,
                        size: 15,
                        color: Colors.blue,
                      ),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
