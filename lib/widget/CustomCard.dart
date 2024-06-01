// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomCard extends StatelessWidget {
  final String date;
  final String category;
  final bool important;
  final String firstname;
  final String lastname;
  final void Function()? editTask;
  final void Function()? onPressedImporntant;
  final void Function(BuildContext)? deleteFunc;

  const CustomCard({
    super.key,
    required this.date,
    required this.firstname,
    required this.lastname,
    required this.category,
    required this.important,
    required this.onPressedImporntant,
    required this.deleteFunc,
    this.editTask,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
              onPressed: deleteFunc,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(20))
        ],
      ),
      child: InkWell(
        onTap: editTask,
        child: Card(
          elevation: 4,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$firstname $lastname",
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo"),
                          ),
                          Text(
                            date,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromARGB(255, 147, 146, 146)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.circle,
                                  size: 14,
                                  color: Color.fromARGB(148, 1, 87, 53)),
                              Text(
                                "ID : $category",
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.topRight,
                    icon: important
                        ? const Icon(
                            Icons.star_rounded,
                            size: 30,
                            color: Color.fromARGB(161, 2, 39, 3),
                          )
                        : const Icon(
                            Icons.star_outline_rounded,
                            size: 30,
                            color: Color.fromARGB(103, 52, 145, 55),
                          ),
                    onPressed: onPressedImporntant,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
