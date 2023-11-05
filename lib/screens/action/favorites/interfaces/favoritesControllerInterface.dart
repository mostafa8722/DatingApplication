
import '../../../../model/response/signlePeople.dart';
import '../../../../model/response/user.dart';

abstract class FavoritesControllerInterface{
  void getData();
  void onClickItem(User user);
  void onClickAction(SinglePeople user);
}