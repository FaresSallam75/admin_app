import 'package:flutter/material.dart';

class CustomAdminHome extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String image;
  const CustomAdminHome(
      {super.key,
      required this.onTap,
      required this.title,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.fill,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 5.0),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }
}
