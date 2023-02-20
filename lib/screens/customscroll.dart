import 'package:ecommerce_app/utlis/app_layout.dart';
import 'package:ecommerce_app/utlis/constant_colors.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/bigtext_widget.dart';
import 'package:ecommerce_app/widgets/expandable_text_widget.dart';
import 'package:ecommerce_app/widgets/smalltext_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomScroll extends StatefulWidget {
  const CustomScroll({super.key});

  @override
  State<CustomScroll> createState() => _CustomScrollState();
}

class _CustomScrollState extends State<CustomScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppLayout.getHeight(25)),
                      topRight: Radius.circular(AppLayout.getHeight(25)),
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                      top: AppLayout.getHeight(5),
                      bottom: AppLayout.getHeight(10)),
                  child: Center(
                    child: BigText(
                      text: "Cerole Rice side dish recipe",
                      fontWeight: true,
                    ),
                  )),
            ),
            expandedHeight: AppLayout.getHeight(242),
            //floating: true,
            pinned: true,
            backgroundColor: Styles.bgColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    
                    "images/meat-1155132_1920.jpg",
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: AppLayout.getHeight(45),
                    left: AppLayout.getHeight(20),
                    right: AppLayout.getHeight(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(7)),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                        Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(7)),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(Icons.shopping_cart_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                  child: const ExpandableTextWidget(
                      text:
                          "We use cookies to personalise content and ads, to provide social media features and to analyse our traffic. We also share information about your use of our site with our social media, advertising and analytics partners who may combine it with other information that you’ve provided to them or that they’ve collected from your use of their services. We are a team of passionate individuals who aspire to fuse the future and present I.T. based challenges by offering innovative software design and development m-commerce solutions. Our key strength lies in the ability to build innovative systems that can be easily integrated with client networks. We are a technical powerhouse that is able to offer top of the range, unique and futuristic technical solutions to all of our partners and clients, THE FUTURE IS NOW! We use cookies to personalise content and ads, to provide social media features and to analyse our traffic. We also share information about your use of our site with our social media, advertising and analytics partners who may combine it with other information that you’ve provided to them or that they’ve collected from your use of their services. We are a team of passionate individuals who aspire to fuse the future and present I.T. based challenges by offering innovative software design and development m-commerce solutions. Our key strength lies in the ability to build innovative systems that can be easily integrated with client networks. We are a technical powerhouse that is able to offer top of the range, unique and futuristic technical solutions to all of our partners and clients, THE FUTURE IS NOW!"),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: AppLayout.getHeight(20),
                right: AppLayout.getHeight(20),
                top: AppLayout.getHeight(10),
                bottom: AppLayout.getHeight(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconSize: AppLayout.getHeight(24),
                  iconColor: Colors.white,
                  backgroundColor: Styles.blueColor,
                ),
                BigText(text: "\$12.88" ' X' " 0", fontWeight: true),
                AppIcon(
                  icon: Icons.add,
                  iconSize: AppLayout.getHeight(24),
                  iconColor: Colors.white,
                  backgroundColor: Styles.blueColor,
                )
              ],
            ),
          ),
          Container(
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
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15), vertical: AppLayout.getHeight(25)),
                  // padding: EdgeInsets.only(
                  //   top: AppLayout.getHeight(30),
                  //   bottom: AppLayout.getHeight(25),
                  // ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(15))),
                  child: Icon(
                    Icons.favorite,
                    color: Styles.blueColor,
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
          )
        ],
      ),
    );
  }
}
