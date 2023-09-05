part of 'favorite_list_scene.dart';

class _FavoriteListSceneBuilder extends BaseSceneWidgetBuilder<_FavoriteListSceneState> {
  const _FavoriteListSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Favorite")));
  }
}
