// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore, deprecated_member_use, unused_local_variable, avoid_unnecessary_containers

import 'package:Dentecs/core/shared/utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // NotificationsController controller = Get.put(NotificationsController());
    return Scaffold(
        // key: controller.scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: appBar(),

        // AppBar(
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(bottom: 10),
        //         child: Text(
        //           '',
        //           style: TextStyle(
        //               fontFamily: "roboto",
        //               fontSize: screenWidth(15),
        //               fontWeight: FontWeight.w500),
        //         ),
        //       ),
        //     ],
        //   ),
        //   backgroundColor: Colors.transparent,
        //   // leading: Padding(
        //   //   padding: const EdgeInsets.only(bottom: 5),
        //   //   child: IconButton(
        //   //       onPressed: () {
        //   //         controller.scaffoldKey.currentState!
        //   //             .openDrawer(); // فتح الـ Drawer عند الضغط على الأيقونة
        //   //       },
        //   //       icon: const Icon(Icons.menu)),
        //   // ),
        // ),
        body: listView()

        //  Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [
        //         Color.fromARGB(196, 225, 238, 239),
        //         Color.fromARGB(255, 255, 255, 255),
        //         Color.fromARGB(255, 255, 255, 255),
        //       ],
        //     ),
        //   ),
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         // SizedBox(
        //         //   height: screenWidth(5),
        //         // ),

        //         SizedBox(
        //           height: screenWidth(3),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('Notifications'),
    );
  }

  Widget listView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return listViewItem(index);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: screenWidth(2000),
          );
        },
        itemCount: 15);
  }

  Widget listViewItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [message(index), timeAndDate(index)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prefixIcon() {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
      child: Icon(
        Icons.notifications,
        size: 25,
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget message(int index) {
    double textsize = 14;
    return Container(
      child: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        text: TextSpan(
            text: 'Message |   ',
            style: TextStyle(
                fontSize: textsize,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            children: const [
              TextSpan(
                text: 'Message Describition',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              )
            ]),
      ),
    );
  }

  Widget timeAndDate(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "21-01-2024",
            style: TextStyle(fontSize: 10),
          ),
          Text(
            "07-10 AM",
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
