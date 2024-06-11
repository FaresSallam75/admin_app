import 'package:flutter/material.dart';

class CustomDropDownTextActive extends StatelessWidget {
  final List<DropdownMenuItem<String>>? itemsData;
  final void Function(String?)? onChanged;
  final String itialValue;
  const CustomDropDownTextActive({
    super.key,
    required this.itemsData,
    required this.onChanged,
    required this.itialValue
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(
          "Active",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        hintStyle: TextStyle(
          fontSize: 14,
        ),
        contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 35, right: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
      value: itialValue,
      onChanged: onChanged,
      items: itemsData,
    );
  }
}
