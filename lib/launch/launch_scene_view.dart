part of 'launch_scene.dart';

class _LaunchSceneBuilder extends BaseSceneWidgetBuilder<_LaunchSceneState> {
  const _LaunchSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: TabBarItem.values.map((item) => BottomNavigationBarItem(label: item.title, icon: Icon(item.icon))).toList(),
            showUnselectedLabels: true,
            currentIndex: state.selectedTabBar.value.index,
            onTap: (index) => state.switchTab(TabBarItem.values[index]),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
          ),
          body: IndexedStack(
            index: state.selectedTabBar.value.index,
            children: [
              IndustryListScene(),
              FavoriteListScene(),
            ],
          ),
        ));
  }
}
