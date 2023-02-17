import 'package:ecommerce_app/utlis/app_infolist.dart';
import 'package:ecommerce_app/utlis/app_layout.dart';
import 'package:flutter/material.dart';

Widget buildCard({required InfoModel infoList}) {
  return SizedBox(
    width: AppLayout.getWidth(200),
    height: AppLayout.getHeight(200),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(AppLayout.getHeight(25)),
      child: Image.asset(infoList.image, fit: BoxFit.cover,)),
  );
}
