import 'package:ecommerce_app/utlis/app_layout.dart';
import 'package:ecommerce_app/utlis/constant_colors.dart';
import 'package:ecommerce_app/widgets/bigtext_widget.dart';
import 'package:ecommerce_app/widgets/smalltext_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(100),
      padding: EdgeInsets.only(
          top: AppLayout.getHeight(30),
          bottom: AppLayout.getHeight(25),
          left: AppLayout.getWidth(20),
          right: AppLayout.getWidth(20)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppLayout.getHeight(20 * 2)),
            topRight: Radius.circular(AppLayout.getHeight(20 * 2)),
          ),
          color: Styles.bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getHeight(17),
                vertical: AppLayout.getHeight(12)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                color: Colors.white),
            child: Row(
              children: [
                const Icon(Icons.remove),
                Gap(AppLayout.getHeight(7)),
                BigText(text: "0", fontWeight: true),
                Gap(AppLayout.getHeight(7)),
                const Icon(Icons.add)
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade200),
              onPressed: () {},
              child: Row(
                children: [
                  SmallText(text: '\$0.08'),
                  Gap(AppLayout.getHeight(5)),
                  SmallText(text: "Add to cart")
                ],
              ))
        ],
      ),
    );
  }
}
