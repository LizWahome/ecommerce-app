import 'package:ecommerce_app/utlis/app_layout.dart';
import 'package:ecommerce_app/utlis/constant_colors.dart';
import 'package:ecommerce_app/utlis/stack_list.dart';
import 'package:ecommerce_app/widgets/bigtext_widget.dart';
import 'package:ecommerce_app/widgets/icon_text_widget.dart';
import 'package:ecommerce_app/widgets/smalltext_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContainerWidget extends StatelessWidget {
  final StackModel stacklist;
  const ContainerWidget({super.key, required this.stacklist});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(120),
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
          right: AppLayout.getHeight(13),
          left: AppLayout.getHeight(13),
          bottom: AppLayout.getHeight(10)),
      //margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      padding: EdgeInsets.all(AppLayout.getHeight(20)),
      // height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getHeight(25)),
          color: Styles.bgColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600,
                offset: const Offset(0, 2),
                blurRadius: 1,
                spreadRadius: 0,
                blurStyle: BlurStyle.inner),
            BoxShadow(color: Styles.bgColor, offset: const Offset(-2, 0)),
            BoxShadow(color: Styles.bgColor, offset: const Offset(2, 0))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: stacklist.foodtype,
            fontWeight: true,
          ),
          Gap(AppLayout.getHeight(7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: Styles.blueColor,
                          size: AppLayout.getHeight(10),
                        )),
              ),
              Gap(AppLayout.getWidth(2)),
              SmallText(text: "4.5"),
              Gap(AppLayout.getWidth(2)),
              SmallText(text: "19841 comments")
            ],
          ),
          Gap(AppLayout.getHeight(7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconTextWidget(
                  text: stacklist.type,
                  color: Styles.containerColor,
                  icon: Icons.circle),
              IconTextWidget(
                  text: stacklist.distance,
                  color: Styles.blueColor,
                  icon: Icons.location_on_sharp),
              IconTextWidget(
                  text: stacklist.duration,
                  color: Styles.containerColor,
                  icon: Icons.access_time)
            ],
          )
        ],
      ),
    );
  }
}
