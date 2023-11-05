import 'package:flutter/material.dart';

import '../../../model/response/signlePeople.dart';

abstract class MapControllerInterface{
  void getDate();
  void selectPeople(SinglePeople singlePeople);
}