import 'package:ai_gong/common/widget/panel_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Common extends GetxService {
  static Common get instance => Get.find<Common>();
  static const bool isDev = true;
  static Logger logger = Logger(filter: MyFilter());
  static const String baseUrl = "http://127.0.0.1:8000/";

  static double get getWidth => GetPlatform.isMobile ? Get.width : 500;

  static SnackbarController showSnackBar(
      {required String messageText,
      Color textColor = Colors.white,
      Color backgroundColor = Colors.black45,
      dynamic position = SnackPosition.TOP}) {
    return Get.rawSnackbar(
      borderRadius: 0,
      snackPosition: position,
      margin: position == SnackPosition.BOTTOM
          ? const EdgeInsets.only(top: 16, left: 16, right: 16)
          : const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      messageText: Text(
        messageText,
        style: TextStyle(
            color: textColor, fontSize: 16, fontWeight: FontWeight.normal),
      ),
      backgroundColor: backgroundColor,
    );
  }

  static void loginPanel({required BuildContext context}) async {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: ((context) {
          return PanelComponent(
            child: Center(
                child: Column(children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              const Text('간단하게 로그인 하고',
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              const SizedBox(
                height: 5,
              ),
              const Text('메타버스 인큐베이터 예약하기',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(
                height: 150,
              ),
              const Text('애공은 가천 계정으로만 로그인 할 수 있어요!',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              const SizedBox(
                height: 5,
              ),
              const Text('ex) abcdefg.gachon.ac.kr',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              const SizedBox(
                height: 100,
              ),
              ButtonTheme(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/google.png', width: 20),
                            SizedBox(width: 15),
                            Text('가천 계정으로 로그인하기',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ],
                        ),
                      ))),
              const SizedBox(
                height: 100,
              ),
            ])),
          );
        }));
  }

  Future<Common> init() async {
    Common.logger.d('$runtimeType init!');
    return this;
  }

  String getNowTime(DateTime now) {
    return '${now.hour > 12 ? '오후' : '오전'} ${now.hour > 12 ? now.hour - 12 : now.hour == 0 ? 12 : now.hour}시 ${now.minute}분';
  }

  String getNowWeek(DateTime now) {
    switch (now.weekday) {
      case 1:
        return '월요일';
      case 2:
        return '화요일';
      case 3:
        return '수요일';
      case 4:
        return '목요일';
      case 5:
        return '금요일';
      case 6:
        return '토요일';
      case 7:
        return '일요일';
      default:
        return '';
    }
  }
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return Common.isDev ? true : false;
  }
}
