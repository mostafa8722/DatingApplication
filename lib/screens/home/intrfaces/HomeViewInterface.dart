import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class HomeViewInterface{
  Widget appbar();
  Widget body(BuildContext context);
  Widget slider(BuildContext context);
  Widget sliderIndicator();
}