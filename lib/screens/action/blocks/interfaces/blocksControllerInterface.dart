
import '../../../../model/response/signlePeople.dart';
import '../../../../model/response/user.dart';

abstract class BlocksControllerInterface{
  void getData();
  void onClickItem(User user);
  void onClickAction(SinglePeople user);
}