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
    this.bottom,
  })  : preferredSize = Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
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
          const SizedBox(width: 10),
          Text(title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )),
        ]),
        centerTitle: false,
        bottom: bottom,
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

class BaseAppBarAction extends StatelessWidget {
  const BaseAppBarAction({
    required this.icon,
    this.color,
    this.tooltip,
    this.onPressed,
    super.key,
  });

  final Widget icon;
  final Color? color;
  final String? tooltip;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: icon,
      color: color,
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }
}
