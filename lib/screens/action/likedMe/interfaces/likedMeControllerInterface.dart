
import '../../../../model/response/user.dart';

abstract class LikedMeControllerInterface{
  void getData();
  void onClickItem(User user);
  void onClickAction(int id);
}