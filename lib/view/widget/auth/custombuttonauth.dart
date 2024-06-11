import 'package:admin_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onBressed;

  const CustomButtonAuth(
      {super.key, required this.text, required this.onBressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        padding: const EdgeInsets.symmetric(vertical: 13),
        color: AppColor.secondColor,
        textColor: AppColor.backGround,
        onPressed: onBressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
