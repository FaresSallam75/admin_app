
import 'package:admin_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonDefault extends StatelessWidget {
  final String text;
  final void Function()? onBressed;

  const CustomButtonDefault(
      {super.key, required this.text, required this.onBressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10 , right: 20 , left: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: AppColor.secondColor,
        textColor: AppColor.backGround,
        onPressed: onBressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
