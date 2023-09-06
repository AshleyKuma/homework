import 'package:flutter/material.dart';

class BaseWidget {
  static Widget cell({required String text, VoidCallback? onTap}) => GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 60,
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text),
                  const Icon(Icons.navigate_next),
                ],
              ),
            ),
            const Divider(height: 1, color: Colors.grey),
          ],
        ),
      );

  static Widget header({required String title}) => SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
        ),
      );

  static Widget detailedColumn({
    required String title,
    required String? content,
    String suffix = "",
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 15)),
          const SizedBox(height: 5),
          Text(content != null ? "$content $suffix" : "-", style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
        ],
      );

  static Widget get emptyView => const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.find_in_page, color: Colors.grey, size: 50),
            SizedBox(height: 20),
            Text("查無資料", style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
}
