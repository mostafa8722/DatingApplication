
import 'package:Lover369/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme/colors.dart';
import '../utils/theme/texts.dart';
import 'divider.dart';

class Button extends StatelessWidget {
  const Button({super.key,required this.onPressed,required this.text,  this.backgroundColor=primaryColor,this.textColor = Colors.white,this.loading = false});

  final Function() onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          )),
      onPressed: (){
        if(!loading){
          onPressed();
        }
      },
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: loading ?const CircularProgressIndicator(color: Colors.white,).marginSymmetric(vertical: 6):PaddingText(
            text.toString(),
            textAlign: TextAlign.center,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            style: normalButtonTextStyle(color:textColor),
          )),
    );
  }
}


class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key,required this.onPressed,required this.text, this.textColor = Colors.black});

  final Function() onPressed;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: PaddingText(
            text.toString(),
            textAlign: TextAlign.center,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            style: normalButtonTextStyle(color: textColor),
          )),
    );
  }
}

class OutlineButtonWithIcon extends StatelessWidget {
  const OutlineButtonWithIcon({super.key,required this.onPressed,required this.text,this.icon,this.imagePath,this.textColor = Colors.white,this.iconColor = Colors.grey});

  final Function() onPressed;
  final Color textColor;
  final Color iconColor;
  final String text;
  final IconData? icon;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
      onPressed: onPressed,
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding:const EdgeInsets.symmetric(horizontal: 32.0),
          child:Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              icon != null ? Icon(icon,color: iconColor,size: 24,):Image(image: AssetImage(imagePath.toString()),width: 20,height: 20,),
              Expanded(child: PaddingText(
                text.toString(),
                textAlign: TextAlign.center,
                padding:const EdgeInsets.symmetric(vertical: 16.0),
                style: normalButtonTextStyle(color:textColor),
              ))
            ],
          )),
    );
  }
}

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({super.key,required this.onPressed,required this.text,this.icon,this.imagePath,this.textColor = Colors.white,this.iconColor = Colors.grey,this.iconSize =24});

  final Function() onPressed;
  final Color textColor;
  final Color iconColor;
  final String text;
  final IconData? icon;
  final String? imagePath;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
      onPressed: onPressed,
      child: Container(
          alignment: Alignment.center,
          padding:const EdgeInsets.symmetric(horizontal: 4.0,vertical: 1),
          child:Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon != null ? Icon(icon,color: iconColor,size: iconSize,):Image(image: AssetImage(imagePath.toString()),width: 20,height: 20,),
              const VerticalTransparentDivider(width: 4,),
              PaddingText(
                text.toString(),
                textAlign: TextAlign.center,
                padding:const EdgeInsets.symmetric(vertical: 2.0),
                style: normalTextStyle(color:textColor),
              )
            ],
          )),
    );
  }
}



class ButtonIcon extends StatelessWidget {
  const ButtonIcon({super.key,required this.onPressed,this.icon,this.imagePath,this.iconColor = Colors.grey});

  final Function() onPressed;
  final Color iconColor;
  final IconData? icon;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
      onPressed: onPressed,
      child: Container(
          alignment: Alignment.center,
          padding:EdgeInsets.symmetric(horizontal: 16.0,vertical: icon != null ? 16:18),
          child:icon != null ? Icon(icon,color: iconColor,size: 24,):Image(image: AssetImage(imagePath.toString()),width: 20,height: 20,),
          ),
    );
  }
}

class BlueButton extends StatelessWidget {
  const BlueButton({super.key,required this.text,required this.onPressed});

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
        child: Button(
          text: text,
          onPressed: () => onPressed,
          backgroundColor: const Color(0xFFEEFBFF),
          textColor: primaryColor,
        ));
  }
}


class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({super.key,required this.onPressed,this.icon,this.imagePath,this.iconColor = Colors.grey,this.backgroundColor = Colors.white,this.size=60});

  final Function() onPressed;
  final Color iconColor;
  final Color backgroundColor;
  final IconData? icon;
  final String? imagePath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: FloatingActionButton(
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      child: Center(
        child:icon != null ? Icon(icon,color: iconColor,size: size-26,):Image(image: AssetImage(imagePath.toString()),width: 20,height: 20,),
      ),
    ));
  }
}




