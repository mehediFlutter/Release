// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:release/const/const_radio.dart';

// import '../new_single_screen_vehicle.dart';

// class SendImage extends StatefulWidget {
//   final Function() onTap;
//   final String name;
//   final bool colorChangeBool;
//   final int? imageLength;
//   final int? numberOfImageProcess;
//   const SendImage(
//       {super.key,
//       required this.onTap,
//       required this.name,
//       required this.colorChangeBool,
//       this.imageLength,
//       this.numberOfImageProcess = 0});

//   @override
//   State<SendImage> createState() => _SendImageState();
// }

// class _SendImageState extends State<SendImage> {
//   FeatureProvider? provider;
//   providerMethod() async {
//     provider = Provider.of<FeatureProvider>(context, listen: false);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         margin: const EdgeInsets.all(4),
//         height: 52,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6),
//             border: Border.all(
//                 color: widget.colorChangeBool
//                     ? Colors.black
//                     : const Color(0xFFE9E9E9))),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               widget.name,
//               style: const TextStyle(fontSize: 14, color: Colors.black),
//             ),
//             const Spacer(),
//             Consumer<FeatureProvider>(
//               builder: (context, provider, child) {
//                 return Text(
//                   "${provider.getImageProcess} / ${widget.imageLength}",
//                 );
//               },
//             ),
//             width15,
//             Container(
//                 height: 20,
//                 width: 20,
//                 decoration: BoxDecoration(
//                     border: widget.colorChangeBool
//                         ? null
//                         : Border.all(color: Colors.grey),
//                     color: widget.colorChangeBool ? Colors.black : Colors.white,
//                     shape: BoxShape.circle),
//                 child: widget.colorChangeBool
//                     ? Stack(
//                         children: [
//                           Center(
//                             child: Container(
//                               height: 8,
//                               width: 8,
//                               decoration: const BoxDecoration(
//                                   color: Colors.white, shape: BoxShape.circle),
//                             ),
//                           ),
//                           loading()
//                         ],
//                       )
//                     : const SizedBox()),
//           ],
//         ),
//       ),
//     );
//   }
// }
