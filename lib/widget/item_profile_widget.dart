// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:fast8_technical_test/utils/color_app.dart';
import 'package:flutter/material.dart';

class ItemProfileWidget extends StatefulWidget {
  const ItemProfileWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  State<ItemProfileWidget> createState() => _ItemProfileWidgetState();
}

class _ItemProfileWidgetState extends State<ItemProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        decoration: const BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: ColorApp.whiteSplash,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: ColorApp.whiteSplash,
            child: Icon(widget.icon, color: ColorApp.text),
          ),
          title: Text(widget.title),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
