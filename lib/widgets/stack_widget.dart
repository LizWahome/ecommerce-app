// import 'package:ecommerce_app/utlis/app_layout.dart';
// import 'package:ecommerce_app/utlis/constant_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class StackView extends StatelessWidget {
//   final Map<String, dynamic> food;
//   const StackView({super.key, required this.food});

//   @override
//   Widget build(BuildContext context) {
//     final size = AppLayout.getSize(context);
//     return Stack(
//       clipBehavior: Clip.none, 
//       children: [
//       Container(
//         margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(50)),
//         width: size.width * 0.75,
//         //height: size.height * 0.3,
//         height: AppLayout.getHeight(250),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             image: DecorationImage(
//                 image: AssetImage(food['image']),
//                 fit: BoxFit.cover)),
//       ),
//       Positioned(
//         bottom: -70,
//         right: 60,
//         left: 60,
//         child: Container(
//           //height: AppLayout.getHeight(200),
//           padding: EdgeInsets.all(AppLayout.getHeight(16)),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Styles.bgColor,
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.grey.shade500,
//                     spreadRadius: 0,
//                     blurRadius: 3,
//                     offset: const Offset(0, 5))
//               ]),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                Text(
//                food['foodtype'],
//                 style: TextStyle(color: Colors.black, fontSize: 25),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "* * * * *",
//                     style: TextStyle(color: Styles.blueColor, fontSize: 20),
//                   ),
//                   Text(
//                     "4.5",
//                     style:
//                         TextStyle(fontSize: 15, color: Styles.smallTextColor),
//                   ),
//                   Text(
//                     "2371 comments",
//                     style:
//                         TextStyle(fontSize: 15, color: Styles.smallTextColor),
//                   )
//                 ],
//               ),
//               Gap(AppLayout.getHeight(5)),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height: AppLayout.getHeight(20),
//                         width: AppLayout.getWidth(20),
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Styles.containerColor),
//                       ),
//                       Gap(AppLayout.getWidth(4)),
//                        Text(food['type']),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.location_on_outlined,
//                         color: Styles.blueColor,
//                       ),
//                        Text(food['distance']),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.access_time,
//                         color: Styles.containerColor,
//                       ),
//                        Text(food['duration'])
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       )
//     ]);
//   }
// }
