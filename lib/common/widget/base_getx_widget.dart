import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {}

abstract class BaseView<T extends BaseController> extends GetView<T> {
  final SystemUiOverlayStyle systemUiOverlayStyle;

  T createController();

  BaseView({super.key, Brightness brightness = Brightness.dark})
      : systemUiOverlayStyle = SystemUiOverlayStyle(
          systemNavigationBarColor: const Color(0xFF000000),
          systemNavigationBarDividerColor: null,
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: brightness,
          statusBarBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light,
        );

  @override
  Widget build(BuildContext context) {
    Get.put(createController());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyle,
      child: sceneWidget(context),
    );
  }

  @protected
  Widget sceneWidget(BuildContext context);
}
