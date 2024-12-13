import 'package:flutter/material.dart';
import 'package:release/screens/new_single_screen/widget/screen_image.dart';
import 'package:release/screens/vehicle_details.dart';

import '../../../DTO/pbl_shop_dto.dart';
import '../../../const/path.dart';
import '../../const/const_radio.dart';
import '../new_single_screen/new_single_screen_vehicle.dart';
import '../new_single_screen/widget/location.dart';
import '../new_single_screen/widget/screen_feature.dart';


class PBLShopProduct extends StatefulWidget {
  final PBLShopDTO product;
  const PBLShopProduct({
    super.key,
    required this.product,
  });

  @override
  State<PBLShopProduct> createState() => _PBLShopProductState();
}

class _PBLShopProductState extends State<PBLShopProduct> {
  bool isFirstSendItemSelected = false;
  bool isSecondSendItemSelected = false;
  bool isThirdSendItemSelected = false;
  bool isFourSendItemSelected = false;
  bool isFiveSendItemSelected = false;
  bool isSharedPressed = false;
  List? vehicleSpecialFeature;

  @override
  @override
  Widget build(BuildContext context) {
   // final feature = Provider.of<FeatureProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VehicleDetails(
                  id: widget.product.id ?? 'None',
                ),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenImage(
                imageUrl: widget.product.image ?? noImageFound,
                code: widget.product.code ?? 'None',
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.title ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Location(
                available: widget.product.available ?? 'None',
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScreenFeature(
                    path: '$iconPath/model_icon.png',
                    featureHeader: 'CONDITION',
                    featureDetails: widget.product.condition ?? 'None',
                  ),
                  ScreenFeature(
                    path: '$iconPath/register_icon.png',
                    featureHeader: 'REGISTRATION',
                    featureDetails: widget.product.registration ?? 'None',
                  ),
                  ScreenFeature(
                    path: '$iconPath/mileage_icon.png',
                    featureHeader: 'MILEAGE',
                    featureDetails: "${widget.product.mileage}",
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.price ?? 'None',
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'inter',
                                  height: 0),
                            ),
                            // Text(
                            //   "Code:${widget.product.code ?? 'None'}",
                            //   style: TextStyle(fontSize: 10, height: 0),
                            // ),
                          ],
                        ),

                        width15,
                        // Edit
                        /*   Expanded(
                          child: InkWell(
                            onTap: () {
                              widget.product.status!
                                  ? TakeMyShopMethod().takeMyShopMethod(
                                      widget.product.id ?? '', context)
                                  : CustomAlertDialog().loginAlertDialog(
                                      context,
                                      "You Can not Clone This Vehicle",
                                      "OK",
                                    );
                              
                            },
                            child: Container(
                              height: 32,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  // color: Color(0xFF000000),
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5.31)),
                              child: widget.product.status!
                                  ? const Center(
                                      child: Text(
                                        "Take at My Shop",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  : const Center(
                                      child: Text("Not Clonal"),
                                    ),
                              // child: Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     SvgPicture.asset(
                              //       "$iconPath/edit.svg",
                              //       width: 15,
                              //       colorFilter: ColorFilter.mode(
                              //           Colors.black, BlendMode.srcIn),
                              //     ),
                              //     width4,
                              //   ],
                              // ),
                            ),
                          ),
                        ),
                        width4,
                        isSharedPressed
                            // Share
                            ? const ShareShimmer(
                                width: double.infinity,
                              )
                            : Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    isSharedPressed = true;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                    SharedPreferences? preferences;
                                    preferences =
                                        await SharedPreferences.getInstance();

                                    await feature.featureProvider(
                                        widget.product.id ?? '',
                                        preferences.getString('token'));

                                    if (context.mounted) {
                                      await show(context, feature, preferences);
                                    }

                                    isSharedPressed = false;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    height: 32,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        // color: Color(0xFFe2e8f0),
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(5.31)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "$iconPath/shareIcon.png",
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                     */
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }

  // Future<dynamic> show(BuildContext context, FeatureProvider feature,
  //     SharedPreferences? preferences) {
  //   return showModalBottomSheet(
  //     useSafeArea: true,
  //     context: context,
  //     builder: (context) {
  //       isFirstSendItemSelected = false;
  //       isSecondSendItemSelected = false;
  //       isThirdSendItemSelected = false;
  //       isFourSendItemSelected = false;
  //       isFiveSendItemSelected = false;

  //       return DraggableScrollableSheet(
  //           initialChildSize: 1,
  //           minChildSize: 0.5,
  //           maxChildSize: 1.0,
  //           builder: (context, scrollController) {
  //             return StatefulBuilder(builder: (context, setState) {
  //               return Container(
  //                 width: double.infinity,
  //                 decoration: const BoxDecoration(
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(10),
  //                     topRight: Radius.circular(10),
  //                   ),
  //                 ),
  //                 child: Padding(
  //                   padding:
  //                       const EdgeInsets.only(top: 20, left: 15, right: 15),
  //                   child: SingleChildScrollView(
  //                     controller: scrollController,
  //                     child: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         const Padding(
  //                           padding:
  //                               EdgeInsets.only(left: 10, top: 12, bottom: 8),
  //                           child: Text(
  //                             "Send as Visitor",
  //                             style: TextStyle(
  //                                 fontSize: 16, fontWeight: FontWeight.w600),
  //                           ),
  //                         ),
  //                         sendMethod(() async {
  //                           //first send method
  //                           isFirstSendItemSelected = true;
  //                           isSecondSendItemSelected = false;
  //                           isThirdSendItemSelected = false;
  //                           isFourSendItemSelected = false;
  //                           isFiveSendItemSelected = false;
  //                           setState(() {});

  //                           await ShareOnlyDetails().shareDetailsWithOneImage(
  //                               loginToken,
  //                               widget.product.image ?? '',
  //                               feature.getFeature);
  //                           isFirstSendItemSelected = false;
  //                           setState(() {});
  //                         }, 'One Image, Short Details, Link',
  //                             isFirstSendItemSelected),
  //                         sendMethod(() async {
  //                           isFirstSendItemSelected = false;
  //                           isSecondSendItemSelected = true;
  //                           isThirdSendItemSelected = false;
  //                           isFourSendItemSelected = false;
  //                           isFiveSendItemSelected = false;
  //                           setState(() {});
  //                           preferences = await SharedPreferences.getInstance();
  //                           await ShareOnlyDetails().shareDetailsWithOneImage(
  //                               loginToken,
  //                               widget.product.image ?? '',
  //                               feature.getFeature + feature.getSpecialFeature);
  //                           isSecondSendItemSelected = false;
  //                           setState(() {});
  //                         }, 'Price, Link, Details, Image',
  //                             isSecondSendItemSelected),
  //                         sendMethod(() async {
  //                           isFirstSendItemSelected = false;
  //                           isSecondSendItemSelected = false;
  //                           isThirdSendItemSelected = true;
  //                           isFourSendItemSelected = false;
  //                           isFiveSendItemSelected = false;
  //                           setState(() {});
  //                           await Share.share(
  //                               '${feature.getFeature}, ${feature.getPrice}, ${feature.getSpecialFeature}');
  //                           isThirdSendItemSelected = false;
  //                           setState(() {});
  //                         }, 'Price, Link, Details', isThirdSendItemSelected),
  //                         const Padding(
  //                           padding:
  //                               EdgeInsets.only(left: 10, top: 12, bottom: 8),
  //                           child: Text(
  //                             "Send as Media",
  //                             style: TextStyle(
  //                                 fontSize: 16, fontWeight: FontWeight.w600),
  //                           ),
  //                         ),
  //                         SendImage(
  //                           onTap: () async {
  //                             isFirstSendItemSelected = false;
  //                             isSecondSendItemSelected = false;
  //                             isThirdSendItemSelected = false;
  //                             isFourSendItemSelected = true;
  //                             isFiveSendItemSelected = false;
  //                             setState(() {});
  //                             await feature.sendAllImages(
  //                               widget.product.id ?? '',
  //                               feature.getGallery,
  //                             );

  //                             isFourSendItemSelected = false;
  //                             setState(() {});
  //                           },
  //                           name: 'All Image',
  //                           colorChangeBool: isFourSendItemSelected,
  //                           imageLength: feature.getGallery.length,
  //                           numberOfImageProcess: feature.getImageProcess,
  //                         ),
  //                         sendMethod(() async {
  //                           isFirstSendItemSelected = false;
  //                           isSecondSendItemSelected = false;
  //                           isThirdSendItemSelected = false;
  //                           isFourSendItemSelected = false;
  //                           isFiveSendItemSelected = true;
  //                           setState(() {});

  //                           await Share.share(
  //                               feature.getFeature + feature.getSpecialFeature);
  //                           isFiveSendItemSelected = false;
  //                           setState(() {});
  //                         }, 'Details', isFiveSendItemSelected),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             });
  //           });
  //     },
  //   );
  // }

  sendMethod(Function() onTap, name, bool colorChangeBool) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.all(4),
        height: 52,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color:
                    colorChangeBool ? Colors.black : const Color(0xFFE9E9E9))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border:
                        colorChangeBool ? null : Border.all(color: Colors.grey),
                    color: colorChangeBool ? Colors.black : Colors.white,
                    shape: BoxShape.circle),
                child: colorChangeBool
                    ? Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                            ),
                          ),
                          loading()
                        ],
                      )
                    : const SizedBox()),
          ],
        ),
      ),
    );
  }
}
