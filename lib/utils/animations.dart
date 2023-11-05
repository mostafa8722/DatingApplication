import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



Animation<Offset> homeCardAnimation(AnimationController animationController){
  return Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, -9.0),
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: Curves.bounceOut,
  ));
}