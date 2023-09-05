import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/base_state.dart';

part 'favorite_list_scene_view.dart';

class FavoriteListScene extends StatefulWidget {
  const FavoriteListScene({super.key});

  static const ROUTE_NAME = "/FavoriteListScene";

  @override
  State<StatefulWidget> createState() => _FavoriteListSceneState();
}

class _FavoriteListSceneState extends BaseSceneState<FavoriteListScene> {
  @override
  void initState() {
    super.initState();
  }

  @override
  BaseStateWidgetBuilder<_FavoriteListSceneState> get widgetBuilder => _FavoriteListSceneBuilder(this);
}
