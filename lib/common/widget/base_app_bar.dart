import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'base_app_text.dart';

const double kToolbarHeight = 56.0;

typedef TitleBuilder = Widget Function(BuildContext, Widget Function(String));

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  BaseAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 1,
  })  : preferredSize = Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  final dynamic title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;
  final Color? backgroundColor;
  final double elevation;

  @override
  final Size preferredSize;

  Widget? _makeTitleWidget(BuildContext context) {
    if (title is TitleBuilder) {
      return title(
        context,
        (title) => BaseAppText.semiBold17(text: title, style: const TextStyle(color: Colors.black)),
      );
    } else if (title is Widget) {
      return title;
    } else if (title is String) {
      return BaseAppText.semiBold17(text: title, style: const TextStyle(color: Colors.black));
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: AppBar(
        title: _makeTitleWidget(context),
        centerTitle: centerTitle,
        leading: leading ?? const BackButton(),
        bottom: bottom,
        backgroundColor: backgroundColor ?? Colors.white,
        elevation: elevation,
        actions: actions,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF000000),
          systemNavigationBarDividerColor: null,
          statusBarColor: Colors.transparent,
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
