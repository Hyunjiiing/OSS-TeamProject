import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

/** 나중에 FCM 공부 더해서 모듈화 할 때 사용할 파일 */

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    _getToken();
    _initNotification();
    super.onInit();
  }

// 확실하지 않음 고쳐야 할 수도 있음
  _getToken() {
    FirebaseMessaging.instance.onTokenRefresh.listen(
      (newToken) async {
        var fcmToken = await FirebaseMessaging.instance.getToken(
            vapidKey:
                "BMHCHgKcjUSCvrtBL90faRjZflJFKYBSJ4yrJAwSiMp4WWCmauxB-Day5S1SOpISAPtgtuxz982sXbmX8LAhmQU");
      },
    );
    FirebaseMessaging.instance.deleteToken();
  }

  void _initNotification() {
    //영상과 다름 (아마도 버전 문제) >> 문제 생기면 여기부터 고치기
    _messaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      provisional: true,
    );
  }
}
