
import '../../../../model/response/user.dart';

abstract class SeenProfileControllerInterface{
  void getData();
  void onClickItem(User user);
  void onClickAction(int id);
}