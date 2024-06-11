import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownSearch extends StatelessWidget {
  final String title;
  final List<SelectedListItem> selectedListItem;
  final TextEditingController dropDownSelectedName;
  final TextEditingController dropDownSelectedId;

  const CustomDropDownSearch(
      {super.key,
      required this.title,
      required this.selectedListItem,
      required this.dropDownSelectedName,
      required this.dropDownSelectedId});

  @override
  Widget build(BuildContext context) {
    showDropDown(context) {
      DropDownState(
        DropDown(
          bottomSheetTitle: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          submitButtonChild: Text(
            '191'.tr,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          data: selectedListItem ?? [],
          selectedItems: (List<dynamic> selectedList) {
            SelectedListItem select = selectedList[0];
            dropDownSelectedName.text = select.name;
            dropDownSelectedId.text = select.value!;

            print("====================================== ");
            print(dropDownSelectedName.text);
            print(dropDownSelectedId.text);
            print("====================================== ");
            // showSnackBar(list.toString());
          },
          enableMultipleSelection: false,
        ),
      ).showModal(context);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: dropDownSelectedName,
        cursorColor: Colors.black,
        onTap: () {
          FocusScope.of(context).unfocus();
          showDropDown(context);
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: const Text(
            "Choose Categories",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          hintText: dropDownSelectedName.text == ""
              ? title
              : dropDownSelectedName.text,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: const Icon(Icons.arrow_drop_down),
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
