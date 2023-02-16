import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/utlis/app_infolist.dart';
import 'package:ecommerce_app/utlis/app_layout.dart';
import 'package:ecommerce_app/utlis/constant_colors.dart';
import 'package:ecommerce_app/utlis/stack_list.dart';
import 'package:ecommerce_app/widgets/buildcard_widget.dart';
import 'package:ecommerce_app/widgets/container_widget.dart';
import 'package:ecommerce_app/widgets/icon_text_widget.dart';
import 'package:ecommerce_app/widgets/smalltext_widget.dart';
import 'package:ecommerce_app/widgets/bigtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller = PageController(initialPage: 0);
  var currPageValue = 0.0;
  double scaleFactor = AppLayout.getHeight(0.8);
  final double _height = AppLayout.getHeight(200);
  double currentIndexPage = 0;

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
                      fontWeight: true,
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
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(20)),
                      color: Styles.blueColor),
                  child: const Center(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: AppLayout.getHeight(300),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: PageView.builder(
                        controller: _controller,
                        onPageChanged: (int page) {
                          setState(() {
                            currentIndexPage = page.toDouble();
                          });
                        },
                        itemCount: infoList.length,
                        itemBuilder: (context, index) {
                          return carouselView(index);
                        }),
                  ),
                ),
                DotsIndicator(
                  dotsCount: infoList.length,
                  position: currPageValue,
                  onTap: (position) {
                    setState(() {
                      currentIndexPage = position;
                      _controller.animateToPage(position.toInt(),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    });
                  },
                ),
                Gap(AppLayout.getHeight(30)),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: AppLayout.getWidth(30)),
                  child: Row(
                    children: [
                      BigText(
                        text: "Popular",
                        fontWeight: false,
                      ),
                      Gap(AppLayout.getHeight(20)),
                      SmallText(text: "Food pairing")
                    ],
                  ),
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: infoList.length,
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: Row(
                        children: [
                          buildCard(infoList: infoList[index]),
                          Container(
                            width: size.width,
                            height: AppLayout.getHeight(170),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                        AppLayout.getHeight(25)),
                                    bottomRight: Radius.circular(
                                        AppLayout.getHeight(25))),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(
                                      text:
                                          "Nutritious fruit meal in Chinahfgyhruhuijaijgiejioajlksljdfijeriufeurhfseijeidf",
                                      fontWeight: false),
                                      Gap(AppLayout.getHeight(15)),
                                  BigText(
                                      text: "With Chinnese characteristics", fontWeight: true,),
                                       Gap(AppLayout.getHeight(15)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      IconTextWidget(
                                          text: "normal",
                                          color: Styles.containerColor,
                                          icon: Icons.circle),
                                      IconTextWidget(
                                          text: "2.4 km",
                                          color: Styles.blueColor,
                                          icon: Icons.location_on_sharp),
                                      IconTextWidget(
                                          text:  "55 mins",
                                          color: Styles.containerColor,
                                          icon: Icons.access_time)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                          //ContainerWidget(stacklist: stackList[index])
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, _) =>
                      Gap(AppLayout.getHeight(10)),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget carouselView(int index) {
    return carouselCard(infoList[index], stackList[index], index);
  }

  Widget carouselCard(InfoModel info, StackModel model, int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (currPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() - 1) {
      var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - scaleFactor) / 2, 1);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Transform(
        transform: matrix,
        child: Stack(children: [
          Container(
            height: AppLayout.getHeight(200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.getHeight(25)),
              image: DecorationImage(
                  image: AssetImage(info.image), fit: BoxFit.fill),
              // boxShadow: const [
              //   BoxShadow(color: Colors.black, offset: Offset(0, 4), blurRadius: 1)
              // ]
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:
                FittedBox(child: ContainerWidget(stacklist: stackList[index])),
          ),
        ]),
      ),
    );
  }
}
