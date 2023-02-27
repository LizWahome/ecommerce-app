import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/routes/route_helper.dart';
import 'package:ecommerce_app/utlis/app_infolist.dart';
import 'package:ecommerce_app/utlis/app_layout.dart';
import 'package:ecommerce_app/utlis/stack_list.dart';
import 'package:ecommerce_app/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
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
    return Column(
      children: [
        GetBuilder<PopolarProductController>(builder: (popularProducts) {
          return SizedBox(
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
                },
              ),
            ),
          );
        }),
        GetBuilder<PopolarProductController>(builder: (popularProducts) {
          return DotsIndicator(
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
          );
        })
      ],
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
          GestureDetector(
             onTap: () {

                  Get.toNamed(RouteHelper.getPopularFood(index));
                },
            child: Container(
              height: AppLayout.getHeight(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(25)),
                image: DecorationImage(image: AssetImage(info.image)
                    ),
              ),
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
