import 'package:flutter/material.dart';

enum TabBarItem {
  industry(title: "產業", icon: Icons.business),
  favorite(title: "追蹤", icon: Icons.star);

  const TabBarItem({
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;
}
