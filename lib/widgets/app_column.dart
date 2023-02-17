import 'package:ecommerce_app/utlis/app_layout.dart';
import 'package:ecommerce_app/utlis/constant_colors.dart';
import 'package:ecommerce_app/widgets/bigtext_widget.dart';
import 'package:ecommerce_app/widgets/icon_text_widget.dart';
import 'package:ecommerce_app/widgets/smalltext_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppColumn extends StatelessWidget {
  final String foodtype;
  const AppColumn({super.key, required this.foodtype});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: foodtype,
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
                text: "normal",
                color: Styles.containerColor,
                icon: Icons.circle),
            IconTextWidget(
                text: "1.7 km",
                color: Styles.blueColor,
                icon: Icons.location_on_sharp),
            IconTextWidget(
                text: "32 mins",
                color: Styles.containerColor,
                icon: Icons.access_time)
          ],
        )
      ],
    );
  }
}
