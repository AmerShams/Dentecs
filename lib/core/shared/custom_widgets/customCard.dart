// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:Dentecs/core/constant/color.dart';

class CustomList extends StatelessWidget {
  final String name;

  const CustomList({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColor.grey2,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
