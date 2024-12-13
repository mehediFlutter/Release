import 'package:flutter/material.dart';

import '../const/color.dart';
import '../const/const_radio.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  final String? hintText;
  final bool isSearch;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  const SearchTextField(
      {super.key,
      required this.searchController,
      this.onChanged,
      this.onSubmit,
      this.hintText,
      this.isSearch = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: borderRadios20,
      ),
      child: TextField(
        cursorColor: Colors.black,
        cursorWidth: 1.2,
        controller: searchController,
        // onChanged: onChanged,
        onSubmitted: onSubmit,
        style: Theme.of(context).textTheme.bodySmall,
        cursorHeight: 15,
        decoration: InputDecoration(
            enabledBorder: searchBarBorder,
            focusedBorder: searchBarBorder,
            contentPadding: const EdgeInsets.only(
              top: 8,
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            prefixIcon: isSearch
                ? const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 15,
                    ),
                  )
                : width10),
        onChanged: onChanged,
      ),
    );
  }
}
