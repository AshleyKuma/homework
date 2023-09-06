import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:io';

const double kToolbarHeight = 56.0;

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  BaseAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.centerTitle,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  final Widget? centerTitle;
  final bool showBackButton;
  final List<Widget>? actions;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final statusBarBrightness = Platform.isAndroid
        ? brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light
        : brightness;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: AppBar(
        title: Row(children: [
          Visibility(
              visible: showBackButton,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              )),
          Text(title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              )),
        ]),
        centerTitle: false,
        leadingWidth: 0,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: actions,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: const Color(0xFF000000),
          systemNavigationBarDividerColor: null,
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: brightness,
          statusBarIconBrightness: statusBarBrightness,
          statusBarBrightness: statusBarBrightness,
        ),
      ),
    );
  }
}

class CompanyDetailedAppBar extends StatelessWidget implements PreferredSizeWidget {
  CompanyDetailedAppBar({
    Key? key,
    required this.title,
    this.centerTitle,
    this.actions,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  final List<Widget>? actions;
  final Widget? centerTitle;
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final statusBarBrightness = Platform.isAndroid
        ? brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light
        : brightness;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: AppBar(
        title: centerTitle,
        centerTitle: true,
        leading: Row(children: [
          const SizedBox(width: 15),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          Text(title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              )),
        ]),
        backgroundColor: Colors.white,
        elevation: 1,
        leadingWidth: 100,
        actions: actions,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: const Color(0xFF000000),
          systemNavigationBarDividerColor: null,
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: brightness,
          statusBarIconBrightness: statusBarBrightness,
          statusBarBrightness: statusBarBrightness,
        ),
      ),
    );
  }
}
