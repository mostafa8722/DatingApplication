

import '../../../../model/response/gallery.dart';
import '../../../../model/response/interests.dart';

abstract class UserControllerInterface{
  void gotoChat();
  void gotoEmail();
  void gotoCall();
  void like();
  void addToContact();
  void block();
  void initializeData();
  void initializeSlider(List<Gallery> gallery);
  void initializeBestPhotos(List<Gallery> gallery);
  void initializeInterests(List<Interests> list);
}