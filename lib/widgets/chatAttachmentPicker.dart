import 'package:flutter/material.dart';
import 'package:get/get.dart';

chatAttachmentPickerDialog(
    BuildContext context,
{
required Function onClickDocument,
required Function onClickGallery,
required Function onClickAudio,
}
    ) {
  showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return
          Column(
          mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin:const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    elevation: 8,
                    shadowColor: Colors.black87,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          attachmentItem(title: "Document", icon: Icons.text_snippet_rounded, color: Colors.orange, onClick: onClickDocument),
                          attachmentItem(title: "Gallery", icon: Icons.photo_library_rounded, color: Colors.purple, onClick: onClickGallery),
                          attachmentItem(title: "Audio", icon: Icons.headphones_rounded, color: Colors.green, onClick: onClickAudio),
                      ],
                    ).paddingAll(16.0),
                  ))
            ]).marginOnly(bottom: 70);
      });
}

attachmentItem({
  required String title,
  required IconData icon,
  required Color color,
  required Function onClick
}){
  return GestureDetector(
      onTap: ()=>onClick(),
      child:Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width:70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
        child: Icon(icon,color: Colors.white),
      ),
      SizedBox(height: 8,width: 0,),
      Text(title)
    ],
  )
  );
}