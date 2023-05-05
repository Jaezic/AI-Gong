import 'package:ai_gong/common/common.dart';
import 'package:ai_gong/pages/list_incubator/controller/list_incubator_view_controller.dart';
import 'package:ai_gong/pages/list_incubator/view/component/incubator_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore_for_file: prefer_const_constructors

class ListIncubatorViewPage extends StatelessWidget {
  const ListIncubatorViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListIncubatorViewController());
    const textstyle = TextStyle(fontSize: 20);
    const textstyle2 = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
    return SizedBox(
        width: Common.getWidth,
        child: Column(
          children: [
            Expanded(
                child: CustomScrollView(
              controller: controller.scrollcontroller.value,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 45, bottom: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('METAVERSE INCUBATOR',
                                    style: textstyle2),
                                const SizedBox(
                                  width: 7,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '소희의실 예약하기',
                                      style: textstyle,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ))),
                SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: HeaderDelegate(controller)),
                Obx(
                  () => SliverList(
                      delegate: SliverChildBuilderDelegate(
                    ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            if (index == 0) const SizedBox(height: 20),
                            IncubatorComponent(
                                model: controller.classRoomList.value[index]),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10, top: 15),
                              child: Divider(
                                height: 1,
                                thickness: 1,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    childCount: controller.classRoomList.length,
                  )),
                )
              ],
            ))
          ],
        ));
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final ListIncubatorViewController controller;
  HeaderDelegate(this.controller);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: shrinkOffset > 0
              ? const Border(bottom: BorderSide(color: Colors.black12))
              : const Border()),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.onTapList.value.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(),
            );
          }),
    );
  }

  @override
  double get maxExtent => 45;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
