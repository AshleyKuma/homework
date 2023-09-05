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
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
        ),
      );
}
