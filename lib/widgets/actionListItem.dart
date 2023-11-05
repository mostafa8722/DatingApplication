
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/enums.dart';
import '../utils/res.dart';
import '../utils/theme/colors.dart';
import '../utils/theme/theme.dart';
import 'divider.dart';

Widget actionListItem({
  required String? name,
  required String? description,
  String? image,
  ActionMode actionMode = ActionMode.like,
  Function? itemClicked,
  Function? actionClicked,
}) {
  Widget? icon;
  switch (actionMode) {
    case ActionMode.like:
      icon = const Icon(
        Res.homeSliderLikeIcon,
        color: homeSliderLikeColor,
        size: 36,
      );
      break;
    case ActionMode.favorite:
      icon = const Icon(
        Res.homeSliderFavoriteIcon,
        color: homeSliderFavoriteColor,
        size: 36,
      );
      break;
    case ActionMode.block:
      icon = Container(
        child: Text(
          "Unblock",
          style: TextStyle(color: primaryColor),
        ),
        decoration: BoxDecoration(border: Border.all(color: primaryColor),borderRadius: BorderRadius.circular(48)),
        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 6),
      );
      break;
    default:
      break;
  }
  return GestureDetector(
      onTap: () {
        itemClicked!();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: actionItemBackgroundColor,
            borderRadius: BorderRadius.circular(actionRounded)),
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  image.toString(),
                  fit: BoxFit.cover,
                )),
            const VerticalTransparentDivider(
              width: 8,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(name != null && name != "null" ? name.toString() : "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                Text(
                    description != null && name != "null"
                        ? description.toString()
                        : "",
                    style: const TextStyle(
                        fontSize: 13, overflow: TextOverflow.ellipsis))
              ],
            )),
            const VerticalTransparentDivider(
              width: 8,
            ),
            Center(
              child: icon != null
                  ? icon is Icon ? IconButton(
                      onPressed: () {
                        actionClicked!();
                      },
                      icon: icon)
                  : icon is Container ? GestureDetector(
                onTap:() {
                  actionClicked!();
                },
                child: icon,
              ):Container():Container())
          ],
        ),
      ));
}
