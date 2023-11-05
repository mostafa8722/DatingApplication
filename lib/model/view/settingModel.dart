import 'package:flutter/material.dart';

class SettingModel{
  String title;
  IconData icon;
  Color color;
  String? label;
  Function? onClick;
  SettingModel(this.title,this.icon,this.color,{this.label,this.onClick});
}