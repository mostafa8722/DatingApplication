
import '../../../../model/response/user.dart';

abstract class ContactsControllerInterface{
  void getData();
  void onClickItem(User user);
}