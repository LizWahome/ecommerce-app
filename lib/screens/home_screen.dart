import 'package:ecommerce_app/utlis/app_infolist.dart';
import 'package:ecommerce_app/utlis/app_layout.dart';
import 'package:ecommerce_app/utlis/constant_colors.dart';
import 'package:ecommerce_app/utlis/stack_list.dart';
import 'package:ecommerce_app/widgets/icon_text_widget.dart';
import 'package:ecommerce_app/widgets/smalltext_widget.dart';
import 'package:ecommerce_app/widgets/bigtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller;
  var currPageValue = 0.0;
  double scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.85);
    _controller.addListener(() {
      setState(() {
        currPageValue = _controller.page!;
      });
    });
    // _controller =
    //     PageController(initialPage: currPageValue, viewportFraction: 0.85);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.containerColor2,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(30),
                vertical: AppLayout.getHeight(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "Bangladesh",
                      color: Styles.blueColor,
                    ),
                    Row(
                      children: [
                        SmallText(text: "Norway"),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(AppLayout.getHeight(17)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Styles.blueColor),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 300,
            child: AspectRatio(
              aspectRatio: 1.5,
              child: PageView.builder(
                  controller: _controller,
                  itemCount: infoList.length,
                  itemBuilder: (context, index) {
                    return carouselView(index);
                  }),
            ),
          ),
          // SmoothPageIndicator(
          //   onDotClicked: (index) => controller.animateToPage(index,
          //       duration: Duration(microseconds: 500), curve: Curves.bounceIn),
          //   controller: controller,
          //   count: infoList.length,
          //   effect: WormEffect(
          //     dotHeight: 9,
          //     dotWidth: 9,
          //     spacing: 9,
          //     dotColor: Styles.blueColor,
          //     activeDotColor: Colors.blueAccent,
          //   ),
          // )
        ],
      ),
      // body: ListView(
      //   children: [

      //     Gap(AppLayout.getHeight(20)),
      //     // ListView.separated(
      //     //   scrollDirection: Axis.horizontal,
      //     //   itemBuilder: (context, index) => stackList.map((e) => StackView(food: e)).toList(),
      //     //   separatorBuilder: (context,  _) => Gap(AppLayout.getWidth(4)),
      //     //   itemCount: 5)
      //     SingleChildScrollView(
      //       physics: BouncingScrollPhysics(),
      //       scrollDirection: Axis.horizontal,
      //       child: Row(
      //         mainAxisSize: MainAxisSize.min,
      //         children: stackList.map((e) => StackView(food: e)).toList(),
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  Widget carouselView(int index) {
    return carouselCard(infoList[index], stackList[index], index);
  }

  Widget carouselCard(InfoModel info, StackModel model, int index) {
      Matrix4 matrix = Matrix4.identity();
    if (index == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (currPageValue - index + 1) * (1 - scaleFactor);
          matrix = Matrix4.diagonal3Values(1, currScale, 1);
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Transform(
        transform: matrix,
        child: Stack(children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: AssetImage(info.image), fit: BoxFit.fill),
              // boxShadow: const [
              //   BoxShadow(color: Colors.black, offset: Offset(0, 4), blurRadius: 1)
              // ]
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(right: 13, left: 13, bottom: 10),
              //margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              padding: EdgeInsets.all(20),
              // height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Styles.bgColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade600,
                        offset: Offset(0, 2),
                        blurRadius: 1,
                        spreadRadius: 0,
                        blurStyle: BlurStyle.inner)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: model.foodtype),
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
                                  size: 15,
                                )),
                      ),
                      SmallText(text: "4.5"),
                      SmallText(text: "19841 comments")
                    ],
                  ),
                  Gap(AppLayout.getHeight(7)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconTextWidget(
                          text: model.type,
                          color: Styles.containerColor,
                          icon: Icons.circle),
                      IconTextWidget(
                          text: model.distance,
                          color: Styles.blueColor,
                          icon: Icons.location_on_sharp),
                      IconTextWidget(
                          text: model.duration,
                          color: Styles.containerColor,
                          icon: Icons.access_time)
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  // Widget carouselView2(int index) {
  //   return carouselCard2(stackList[index]);
  // }

  // Widget carouselCard2(StackModel model) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(25),
  //         color: Styles.bgColor,
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.grey.shade500,
  //               spreadRadius: 0,
  //               blurRadius: 3,
  //               offset: const Offset(0, 5)),
  //         ]),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         SmallText(text: model.foodtype),
  //         Row(
  //           children: [
  //             BigText(text: "* * * * *"),
  //             SmallText(text: "4.5"),
  //             SmallText(text: "1281 comment"),
  //           ],
  //         ),
  //         Gap(AppLayout.getHeight(5)),
  //         Row(
  //           children: [
  //             Row(
  //               children: [
  //                 Container(
  //                   height: AppLayout.getHeight(20),
  //                   width: AppLayout.getWidth(20),
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.circle, color: Styles.containerColor),
  //                 ),
  //                 Gap(AppLayout.getWidth(4)),
  //                 SmallText(text: model.type)
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Icon(
  //                   Icons.location_on_outlined,
  //                   color: Styles.blueColor,
  //                 ),
  //                 SmallText(text: model.distance)
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Icon(
  //                   Icons.access_time,
  //                   color: Styles.containerColor,
  //                 ),
  //                 SmallText(text: model.duration)
  //               ],
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}
