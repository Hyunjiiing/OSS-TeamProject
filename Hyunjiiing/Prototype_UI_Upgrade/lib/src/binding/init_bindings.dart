import 'package:get/get.dart';
import 'package:keunalarm/src/controller/bottom_nav_controller.dart';

/** 앱이 시작되는 동시에 getXcontroller를 필요에 따라 인스턴스로 올려주기 위한 클래스 */
class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}
