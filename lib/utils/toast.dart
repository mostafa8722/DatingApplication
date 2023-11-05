import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toast(FToast fToast,String message,{ToastType type=ToastType.None}){
  fToast.showToast(child: toastWidget(message,type:type ),toastDuration: Duration(seconds: 3,),gravity: ToastGravity.BOTTOM);
}

Widget toastWidget(String message,{ToastType type=ToastType.None}) {
  Color color = Colors.black38;
  switch(type){
    case ToastType.Success:color=Colors.green;break;
    case ToastType.Warning:color=Colors.orange;break;
    case ToastType.Error:color=Colors.red;break;
    case ToastType.None:break;
  }
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: color,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon(Icons.check),
        // SizedBox(
        //   width: 12.0,
        // ),
        Flexible(child:Text(message,style: const TextStyle(color: Colors.white),maxLines: 4,overflow: TextOverflow.ellipsis,softWrap: true)),
      ],
    ),
  );
}

enum ToastType{
  Success,
  Warning,
  Error,
  None
}