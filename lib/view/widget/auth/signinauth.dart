import 'package:admin_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomeTextSignUpORSignIn extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final void Function()? onTab;
  const CustomeTextSignUpORSignIn(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textOne,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        InkWell(
          onTap: onTab,
          child: Text(
            textTwo,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.secondColor),
          ),
        )
      ],
    );
  }
}
