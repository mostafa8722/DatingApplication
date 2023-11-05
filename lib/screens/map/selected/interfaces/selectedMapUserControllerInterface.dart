import 'package:flutter/material.dart';

import '../../../../model/response/signlePeople.dart';

abstract class SelectedMapUserControllerInterface{
  void initializeData();
  void like(SinglePeople singlePeople);
  void chat(SinglePeople singlePeople);
  void showSingle(SinglePeople singlePeople);
  void call(SinglePeople singlePeople);
  AnimationController animationController();
}