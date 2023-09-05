import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  late BaseStateWidgetBuilder _widgetBuilder;

  List<StreamSubscription> disposeBag = [];

  List<ChangeNotifier> controllers = [];

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    _widgetBuilder = widgetBuilder;
    SchedulerBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    disposeBag.forEach((disposable) => disposable.cancel());
    controllers.forEach((controller) => controller.dispose());
  }

  @override
  Widget build(BuildContext context) => _widgetBuilder.build(context);

  @protected
  BaseStateWidgetBuilder get widgetBuilder;
}

abstract class BaseStateWidgetBuilder<T extends BaseState> {
  const BaseStateWidgetBuilder(this.state);

  final T state;

  Widget build(BuildContext context);
}

abstract class BaseSceneState<T extends StatefulWidget> extends BaseState<T> {
  Future<bool> Function()? get onWillPop => null;
}

abstract class BaseSceneWidgetBuilder<T extends BaseSceneState> extends BaseStateWidgetBuilder<T> {
  const BaseSceneWidgetBuilder(T state) : super(state);

  @override
  Widget build(BuildContext context) => WillPopScope(
        /// for iOS users, set onWillPop to null to enable swipe left to go back.
        onWillPop: state.onWillPop,
        child: sceneWidget(context),
      );

  @protected
  Widget sceneWidget(BuildContext context);
}
