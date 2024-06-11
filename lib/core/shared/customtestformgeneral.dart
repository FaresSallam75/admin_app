import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustoemTextFormGeneral extends StatelessWidget {
  final String labl;
  final String hinText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? obscuretext;
  void Function()? onTapIcon;

  CustoemTextFormGeneral(
      {super.key,
      this.onTapIcon,
      required this.labl,
      required this.hinText,
      required this.iconData,
      required this.myController,
      required this.valid,
      required this.isNumber,
      this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: Theme.of(context).textTheme.headlineSmall,
        obscureText: obscuretext == null || obscuretext == false ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.multiline,
        validator: valid,
        controller: myController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            labl,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          hintText: hinText,
          hintStyle:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 15),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(iconData),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
