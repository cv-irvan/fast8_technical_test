// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../utils/color_app.dart';

class ItemProdukWidget extends StatefulWidget {
  const ItemProdukWidget(
      {super.key, required this.img, required this.title, required this.price});

  final String img;
  final String title;
  final String price;

  @override
  State<ItemProdukWidget> createState() => _ItemProdukWidgetState();
}

class _ItemProdukWidgetState extends State<ItemProdukWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.img),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.price,
            style: const TextStyle(
              color: ColorApp.primary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
