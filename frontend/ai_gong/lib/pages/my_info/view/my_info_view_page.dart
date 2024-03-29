import 'package:ai_gong/Service/user_service.dart';
import 'package:ai_gong/common/common.dart';
import 'package:ai_gong/pages/main/controller/main_view_controller.dart';
import 'package:ai_gong/pages/my_info/controller/my_info_view_controller.dart';
import 'package:ai_gong/pages/my_info/view/component/myInfo_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Summary:
// MyInfoViewPage is used to show the my info view
// This view is GetX view
class MyInfoViewPage extends StatelessWidget {
  const MyInfoViewPage({super.key});

  static const String url = '/info';
  @override
  Widget build(BuildContext context) {
    final controller = MyInfoViewController.instance;
    final userService = UserService.instance;
    return SizedBox(
      width: Common.getWidth,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 15, top: 25, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${userService.user.value.nickname}님의 활동",
                            //textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18, color: Color.fromRGBO(103, 103, 103, 1)),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              // const Text(
                              //   "찜 4개",
                              //   //textAlign: TextAlign.center,
                              //   style: TextStyle(fontSize: 24, fontFamily: 'SuitEB'),
                              // ),
                              // const SizedBox(width: 40),
                              Text(
                                "예약 ${controller.myReservationList.length}건",

                                //textAlign: TsextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'SuitEB',
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 45),
                        ],
                      ),
                    ),
                  ],
                )),

            //Expanded(
            Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(children: [
                  Container(
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "예약현황",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SuitEB',
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    height: 1,
                    alignment: Alignment.centerLeft,
                    child: const SizedBox(
                      width: 75,
                      height: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ])),
            Obx(
              () => Column(children: [
                for (int index = 0; index < controller.myReservationList.length; index++)
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          if (index == 0) const SizedBox(height: 20),
                          MyInfoComponent(model: controller.myReservationList.value[index]),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10, top: 15),
                            child: Divider(
                              height: 1,
                              thickness: 1,
                            ),
                          )
                        ],
                      ))
              ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              //margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.myReservationList.isEmpty ? "예약 정보가 없습니다." : "새로운 예약을 해보세요.",
                      style: const TextStyle(color: Color.fromRGBO(103, 103, 103, 1), fontSize: 17)),
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 140, 255)),
                      minimumSize: MaterialStateProperty.all(const Size(90, 40)),
                    ),
                    onPressed: () {
                      MainViewController.instance.selectTab(1);
                    },
                    child: const Text(
                      '예약하기',
                      style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // child: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                    ),
                    onPressed: () {
                      UserService.instance.logout();
                    },
                    child: const Text(
                      '로그아웃',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            // ),

            // Container(
            //   // width: 600,
            //   // color: Colors.red,
            //   padding:
            //       EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            //   //margin: EdgeInsets.all(15),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("예약 정보가 없습니다.",
            //           style: TextStyle(
            //               color: Color.fromRGBO(103, 103, 103, 1),
            //               fontSize: 17)),
            //       TextButton(
            //         style: ButtonStyle(
            //           shape: MaterialStateProperty.all<
            //               RoundedRectangleBorder>(
            //             RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(13.0),
            //             ),
            //           ),
            //           backgroundColor: MaterialStateProperty.all<Color>(
            //               Color.fromARGB(255, 0, 140, 255)),
            //           minimumSize:
            //               MaterialStateProperty.all(Size(90, 40)),
            //         ),
            //         onPressed: () {},
            //         child: Text(
            //           '예약하기',
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 13,
            //               fontWeight: FontWeight.w400),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            //         ],
            //       ),
            //     ),

            // Container(
            //   child: Expanded(
            //     child: Align(
            //       alignment: Alignment.bottomCenter,
            //       child: Container(
            //         margin: EdgeInsets.only(bottom: 20.0),
            //         child: TextButton(
            //           style: ButtonStyle(
            //             shape: MaterialStateProperty.all<
            //                 RoundedRectangleBorder>(
            //               RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(15.0),
            //               ),
            //             ),
            //             backgroundColor:
            //                 MaterialStateProperty.all<Color>(Colors.white),
            //             minimumSize:
            //                 MaterialStateProperty.all(Size(100, 50)),
            //           ),
            //           onPressed: () {},
            //           child: Text(
            //             '로그아웃',
            //             style: TextStyle(color: Colors.black, fontSize: 15),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );

    // ],
    // ))
    // ],
    // ));

    // return Scaffold(
    //     body: Align(
    //         alignment: Alignment.center,
    //         // child: SingleChildScrollView(
    //         child: Container(
    //           //height: 1000,
    //           width: Common.getWidth,
    //           margin: EdgeInsets.all(25),

    //           // child: SingleChildScrollView(
    //           // child: Column(
    //           // child: Expanded(
    //           //     child: SingleChildScrollView(
    //           child: Column(
    //             children: [
    //               // SingleChildScrollView(
    //               //   scrollDirection: Axis.vertical,
    //               // ),

    //               Container(
    //                 child: Column(
    //                   //mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       "홍길동님의 활동",
    //                       //textAlign: TextAlign.center,
    //                       style: TextStyle(
    //                           fontSize: 18,
    //                           color: Color.fromRGBO(103, 103, 103, 1)),
    //                     ),
    //                     SizedBox(height: 12),
    //                     Row(
    //                       children: [
    //                         Text(
    //                           "찜 4개",
    //                           //textAlign: TextAlign.center,
    //                           style:
    //                               TextStyle(fontSize: 24, fontFamily: 'SuitEB'),
    //                         ),
    //                         SizedBox(width: 40),
    //                         Text(
    //                           "예약 2건",

    //                           //textAlign: TextAlign.center,
    //                           style: TextStyle(
    //                             fontFamily: 'SuitEB',
    //                             fontSize: 24,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     SizedBox(height: 45),
    //                   ],
    //                 ),
    //               ),

    //               //Expanded(
    //               Column(
    //                 children: [
    //                   Container(
    //                     alignment: Alignment.centerLeft,
    //                     child: Text(
    //                       "예약현황",
    //                       style: TextStyle(
    //                         fontSize: 20,
    //                         fontFamily: 'SuitEB',
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(height: 2),
    //                   Container(
    //                     height: 1,
    //                     alignment: Alignment.centerLeft,
    //                     child: SizedBox(
    //                       width: 75,
    //                       height: 1,
    //                       child: DecoratedBox(
    //                         decoration: BoxDecoration(
    //                           color: Colors.black,
    //                         ),
    //                       ),
    //                     ),
    //                   ),

    //                   Obx(() => SliverList(
    //                         delegate: SliverChildBuilderDelegate(
    //                           ((context, index) {
    //                             return Padding(
    //                               padding:
    //                                   const EdgeInsets.symmetric(horizontal: 5),
    //                               child: Column(
    //                                 children: [
    //                                   if (index == 0)
    //                                     const SizedBox(height: 20),
    //                                   MyInfoComponent(
    //                                     model:
    //                                         controller.myReservationList[index],
    //                                   ),
    //                                   const Padding(
    //                                     padding: EdgeInsets.only(
    //                                         bottom: 10, top: 15),
    //                                     child: Divider(
    //                                       height: 1,
    //                                       thickness: 1,
    //                                     ),
    //                                   )
    //                                 ],
    //                               ),
    //                             );
    //                           }),
    //                           childCount: controller.myReservationList.length,
    //                         ),
    //                       )),
    //                   Container(
    //                     // width: 600,
    //                     // color: Colors.red,
    //                     padding:
    //                         EdgeInsets.symmetric(vertical: 25, horizontal: 10),
    //                     //margin: EdgeInsets.all(15),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text("예약 정보가 없습니다.",
    //                             style: TextStyle(
    //                                 color: Color.fromRGBO(103, 103, 103, 1),
    //                                 fontSize: 17)),
    //                         TextButton(
    //                           style: ButtonStyle(
    //                             shape: MaterialStateProperty.all<
    //                                 RoundedRectangleBorder>(
    //                               RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.circular(13.0),
    //                               ),
    //                             ),
    //                             backgroundColor:
    //                                 MaterialStateProperty.all<Color>(
    //                                     Color.fromARGB(255, 0, 140, 255)),
    //                             minimumSize:
    //                                 MaterialStateProperty.all(Size(90, 40)),
    //                           ),
    //                           onPressed: () {},
    //                           child: Text(
    //                             '예약하기',
    //                             style: TextStyle(
    //                                 color: Colors.white,
    //                                 fontSize: 13,
    //                                 fontWeight: FontWeight.w400),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   //         ],
    //                   //       ),
    //                   //     ),
    //                 ],
    //               ),
    //               Container(
    //                 child: Expanded(
    //                   child: Align(
    //                     alignment: Alignment.bottomCenter,
    //                     child: Container(
    //                       margin: EdgeInsets.only(bottom: 20.0),
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           shape: MaterialStateProperty.all<
    //                               RoundedRectangleBorder>(
    //                             RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(15.0),
    //                             ),
    //                           ),
    //                           backgroundColor: MaterialStateProperty.all<Color>(
    //                               Colors.white),
    //                           minimumSize:
    //                               MaterialStateProperty.all(Size(100, 50)),
    //                         ),
    //                         onPressed: () {},
    //                         child: Text(
    //                           '로그아웃',
    //                           style:
    //                               TextStyle(color: Colors.black, fontSize: 15),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         )));
  }
}
