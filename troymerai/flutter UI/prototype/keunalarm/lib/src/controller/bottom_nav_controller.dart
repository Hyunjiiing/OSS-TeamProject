import 'package:get/get.dart';

enum PageName { HOME, CALENDER, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
        _changePage(value, hasGesture: hasGesture);
        break;
      case PageName.CALENDER:
        _changePage(value, hasGesture: hasGesture);
        break;
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

/** bottomnavigation의 history를 저장했다가 라우팅 관리에 사용할 수 있음 */
  void _changePage(int value, {bool hasGesture: true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
      // print(bottomHistory);
    }
  }

  /** onwillpop을 이용하면 해당 이벤트가 호출되었는지 알 수 있다 */

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      return true;
    } else {
      /**뒤로가기 하면 bottomnavigation history의 마지막 값을 지우면서 돌아간다 */
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      // print(bottomHistory);
      return false;
    }
  }
}
