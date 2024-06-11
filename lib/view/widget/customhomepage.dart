import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;

  final void Function()? onPressedIconSearch;
  final void Function()? onPressedIconFavorite;
  final void Function(String)? onChanged;
  final TextEditingController myController;

  const CustomAppBar(
      {super.key,
      required this.titleAppBar,
      required this.onPressedIconSearch,
      required this.onPressedIconFavorite,
      required this.onChanged,
      required this.myController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              controller: myController,
              decoration: InputDecoration(
                  prefixIcon:   IconButton(
                    onPressed: onPressedIconSearch,
                    icon:   const Icon(Icons.search) 
                  ),
                  hintText: titleAppBar,
                  hintStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[300]),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          /*   Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: 60,
            child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 27,
                color: Colors.grey[600],
              ),
            ),
          ) */
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: 60,
            child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 27,
                color: Colors.grey[600],
              ),
            ),
          )
        ],
      ),
    );
  }
}
