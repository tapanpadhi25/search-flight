import 'package:flutter/material.dart';
import 'package:search_flight/utility/theme.dart';

class CustomAppBar {
  final String title;
  List<Widget>? action;
  final PreferredSize? bottom;
  bool? centerTitle;
  final BuildContext context;
  final bool first;

  CustomAppBar(
      {required this.title,
      this.action,
      this.bottom,
      this.centerTitle = false,
      required this.context, required this.first});

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffC4E59E),
      elevation: 0,
      centerTitle: centerTitle,
      leading:  IconButton(
          onPressed: () {
            (first == true)?null:  Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      title: Text(title,style: CustomTheme.getTheme()!.textTheme.titleMedium,),
      actions: action,
      bottom: bottom,
    );
  }
}
