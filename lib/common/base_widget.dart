import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidget {
  static Widget cell({required String text, VoidCallback? onTap}) => GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Container(
            height: 50,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                const Icon(Icons.navigate_next),
              ],
            ),
          ),
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
}
