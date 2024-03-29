import 'package:ai_gong/common/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_view_controller.dart';

// Summary:
// MainViewPage is used to show the main view
// Features:
// - Show the main view
class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  static const String url = '/main';
  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Align(alignment: Alignment.topCenter, child: Obx(() => controller.bodyContent[controller.pageIndex.value]))),
      bottomNavigationBar: homeNavigationBar(),
    );
  }

  static Widget homeNavigationBar() {
    final controller = MainViewController.instance;
    return Title(
      title: PageTitle.main,
      color: Colors.white,
      child: Material(
        child: Container(
          decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.2))),
          child: SafeArea(
            top: false,
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  children: [
                    Expanded(child: _bottomNavigationButton(index: 0, icon: [Icons.feed_outlined, Icons.feed])),
                    // Expanded(child: _bottomNavigationButton(index: 1, icon: [Icons.search_outlined, LineIcons.search])),
                    Expanded(child: _bottomNavigationButton(index: 1, icon: [Icons.access_time, Icons.access_time_filled])),
                    Expanded(child: _bottomNavigationButton(index: 2, icon: [Icons.account_circle_outlined, Icons.account_circle])),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _bottomNavigationButton({required int index, required List<IconData> icon}) {
    final controller = MainViewController.instance;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        controller.selectTab(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Obx(() => Icon(icon[index == controller.pageIndex.value ? 1 : 0])),
      ),
    );
  }
}
