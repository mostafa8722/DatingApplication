
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/res.dart';
import '../utils/theme/theme.dart';
import 'divider.dart';

Widget seenProfileListItem({
  required String? name,
  required String? description,
  String? image,
  Function? itemClicked,
  Function? actionClicked,
}) {

  return GestureDetector(
  onTap:(){itemClicked!();},
    child: Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    height: 70,
    width: double.infinity,
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
            Text(name!=null ? name.toString():"",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Text(description!= null ? description.toString():"",
                style: const TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis))
          ],
        )),
      ],
    ),
  ));
}
