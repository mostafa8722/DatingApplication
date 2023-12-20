

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorConnection extends StatelessWidget{
   var  handleTry;
   bool? notExpanded=false;
  ErrorConnection(this.handleTry,[this.notExpanded=false]);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return notExpanded==true?Error():Expanded(child:Error() );
  }
  Widget Error(){
    return Center(child: Column(children: [
      Text("Error in internet Connection"),
      SizedBox(height: 10,),
      Text("Make sure your connection to internet then touch try again"),
      SizedBox(height: 10,),
      ElevatedButton(onPressed: handleTry, child: Text("Try Again ",style: TextStyle(color: Colors.white),))
    ],),);
  }
}