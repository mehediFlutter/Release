import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
// import 'package:pilot_bazar_admin/screens/new_single_screen/widget/more_vert/availability.dart';
// import 'package:pilot_bazar_admin/screens/new_single_screen/widget/more_vert/edit_price_screen.dart';
// import 'package:pilot_bazar_admin/share_details.dart/share_only_details.dart';
// import 'package:pilot_bazar_admin/shimmer_effect/shimmer_effect.dart';
// import 'package:pilot_bazar_admin/socket_io/tokens.dart';
import 'package:provider/provider.dart';
import 'package:release/DTO/get_all_vehicle_dao.dart';
import 'package:release/const/path.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../../const/permission.dart';
import '../../../provider/socket_method_provider.dart';
// import '../../widget/alert_dialog.dart';
import '../../../widget/urls.dart';
import '../bottom_navigation_bar/bottom_navigation_bar.dart';
import '../pbl_shop/pbl_shop.dart';
import '../vehicle_details.dart';
import 'widget/location.dart';
import 'widget/screen_feature.dart';
import 'widget/screen_image.dart';
// import 'widget/more_vert/more_vert_container.dart';
// import 'widget/send_image.dart';

class NewSingleScreenProduct extends StatefulWidget {
  final GetAllVehicleDTO product;
  const NewSingleScreenProduct({
    super.key,
    required this.product,
  });

  @override
  State<NewSingleScreenProduct> createState() => _NewSingleScreenProductState();
}

class _NewSingleScreenProductState extends State<NewSingleScreenProduct> {
  SharedPreferences? preferences;
  bool isFirstSendItemSelected = false;
  bool isSecondSendItemSelected = false;
  bool isThirdSendItemSelected = false;
  bool isFourSendItemSelected = false;
  bool isFiveSendItemSelected = false;
  bool isSharedPressed = false;
  List? vehicleSpecialFeature;
  bool isMerchant = true;

  Future deleteVehicle(String id) async {
    preferences = await SharedPreferences.getInstance();
    Response response = await http.delete(
      Uri.parse("$appApiServerUrl/api/v1/vehicle-management/products/$id"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Encoding': 'application/gzip',
        'Authorization': 'Bearer ${preferences?.getString('token')}'
      },
    );

    if (response.statusCode == 200) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Delete Successfully")));
      }
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavBaseScreen()),
            (route) => false);
      }
      if (mounted) {
        Provider.of<SocketMethodProvider>(context, listen: false)
            .getVehicleCollection;
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Something wrong please try again!")));
      }
      if (mounted) {
        Navigator.pop(context);
        Navigator.pop(context);
      }
    }
  }

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
                            Consumer<SocketMethodProvider>(
                              builder: (context, cart, child) {
                                return Text(
                                  widget.product.price ?? 'None',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'inter',
                                    height: 0,
                                  ),
                                );
                              },
                            ),
                            // Text(
                            //   "Code:${widget.product.code ?? 'None'}",
                            //   style: TextStyle(fontSize: 10, height: 0),
                            // ),
                          ],
                        ),

                        /*   width15,
                        // Edit
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return DraggableScrollableSheet(
                                      initialChildSize:
                                          1, // Start at half screen
                                      minChildSize:
                                          0.5, // Minimum size when collapsed
                                      maxChildSize:
                                          1.0, // Maximum size when fully expanded
                                      builder: (context, scrollController) {
                                        return StatefulBuilder(
                                            builder: (context, setState) {
                                          return Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, left: 15, right: 15),
                                              child: SingleChildScrollView(
                                                controller: scrollController,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    isCreateVehicle!
                                                        ? MoreVertContainer(
                                                            text: 'Edit Price',
                                                            onTap: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          EditPriceScreen(
                                                                    askingPrice: widget
                                                                        .product
                                                                        .editable
                                                                        ?.asking,
                                                                    fixedPrice: widget
                                                                        .product
                                                                        .editable
                                                                        ?.fixed,
                                                                    purchasePrice: widget
                                                                        .product
                                                                        .editable
                                                                        ?.purchase,
                                                                    vehicleId: widget
                                                                            .product
                                                                            .id ??
                                                                        '',
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          )
                                                        : const MoreVertDisableContainer(
                                                            text: 'Edit Price',
                                                          ),
                                                    height15,
                                                    MoreVertContainer(
                                                      text: 'Availability',
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Availability(
                                                                          vehicleId:
                                                                              widget.product.id ?? '',
                                                                        )));
                                                      },
                                                    ),
                                                    height15,
                                                    MoreVertContainer(
                                                      text: 'Stock List',
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const StockList()));
                                                      },
                                                    ),
                                                    height15,
                                                    isDeleteVehicle!
                                                        ? MoreVertContainer(
                                                            text:
                                                                'Delete Vehicle',
                                                            onTap: () {
                                                              CustomAlertDialog()
                                                                  .newLogOutAndDeleteDialog(
                                                                context,
                                                                'Are you sure want to delete',
                                                                'Delete',
                                                                'Cancel',
                                                                () async {
                                                                  deleteVehicle(widget
                                                                          .product
                                                                          .id ??
                                                                      '');
                                                                },
                                                              );
                                                            },
                                                          )
                                                        : const MoreVertDisableContainer(
                                                            text:
                                                                'Delete Vehicle'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                      });
                                },
                              );
                            },
                            child: Container(
                              height: 32,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  // color: Color(0xFF000000),
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5.31)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "$iconPath/edit.svg",
                                    width: 15,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.black, BlendMode.srcIn),
                                  ),
                                  width4,
                                  // Text(
                                  //   "Edit",
                                  //   style: TextStyle(
                                  //       fontSize: 12,
                                  //       fontWeight: FontWeight.w400,
                                  //       color: Colors.white,
                                  //       fontFamily: 'inter'),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        width4,
                      */
                        /*    isSharedPressed
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
                                      showModalBottomSheet(
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          isFirstSendItemSelected = false;
                                          isSecondSendItemSelected = false;
                                          isThirdSendItemSelected = false;
                                          isFourSendItemSelected = false;
                                          isFiveSendItemSelected = false;

                                          return DraggableScrollableSheet(
                                              initialChildSize:
                                                  1, // Start at half screen
                                              minChildSize:
                                                  0.5, // Minimum size when collapsed
                                              maxChildSize:
                                                  1.0, // Maximum size when fully expanded
                                              builder:
                                                  (context, scrollController) {
                                                return StatefulBuilder(builder:
                                                    (context, setState) {
                                                  return Container(
                                                    width: double.infinity,
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              left: 15,
                                                              right: 15),
                                                      child:
                                                          SingleChildScrollView(
                                                        controller:
                                                            scrollController,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10,
                                                                      top: 12,
                                                                      bottom:
                                                                          8),
                                                              child: Text(
                                                                "Send as Visitor",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            sendMethod(
                                                                () async {
                                                              //first send method
                                                              isFirstSendItemSelected =
                                                                  true;
                                                              isSecondSendItemSelected =
                                                                  false;
                                                              isThirdSendItemSelected =
                                                                  false;
                                                              isFourSendItemSelected =
                                                                  false;
                                                              isFiveSendItemSelected =
                                                                  false;
                                                              setState(() {});

                                                              await ShareOnlyDetails()
                                                                  .shareDetailsWithOneImage(
                                                                      loginToken,
                                                                      widget.product
                                                                              .image ??
                                                                          '',
                                                                      feature
                                                                          .getFeature);
                                                              isFirstSendItemSelected =
                                                                  false;
                                                              setState(() {});
                                                            }, 'One Image, Short Details, Link',
                                                                isFirstSendItemSelected),
                                                            sendMethod(
                                                                () async {
                                                              isFirstSendItemSelected =
                                                                  false;
                                                              isSecondSendItemSelected =
                                                                  true;
                                                              isThirdSendItemSelected =
                                                                  false;
                                                              isFourSendItemSelected =
                                                                  false;
                                                              isFiveSendItemSelected =
                                                                  false;
                                                              setState(() {});
                                                              preferences =
                                                                  await SharedPreferences
                                                                      .getInstance();
                                                              await ShareOnlyDetails()
                                                                  .shareDetailsWithOneImage(
                                                                      loginToken,
                                                                      widget.product
                                                                              .image ??
                                                                          '',
                                                                      "${feature.getFeature}${feature.getSpecialFeature}\nShow More\n\n${feature.getLink}");
                                                              isSecondSendItemSelected =
                                                                  false;
                                                              setState(() {});
                                                            }, 'Price, Link, Details, Image',
                                                                isSecondSendItemSelected),
                                                            sendMethod(
                                                                () async {
                                                              isFirstSendItemSelected =
                                                                  false;
                                                              isSecondSendItemSelected =
                                                                  false;
                                                              isThirdSendItemSelected =
                                                                  true;
                                                              isFourSendItemSelected =
                                                                  false;
                                                              isFiveSendItemSelected =
                                                                  false;
                                                              setState(() {});
                                                              await Share.share(
                                                                  '${feature.getFeature}, ${feature.getPrice}, ${feature.getSpecialFeature}\nShow More\n\n${feature.getLink}');
                                                              isThirdSendItemSelected =
                                                                  false;
                                                              setState(() {});
                                                            }, 'Price, Link, Details',
                                                                isThirdSendItemSelected),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10,
                                                                      top: 12,
                                                                      bottom:
                                                                          8),
                                                              child: Text(
                                                                "Send as Media",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            SendImage(
                                                              onTap: () async {
                                                                isFirstSendItemSelected =
                                                                    false;
                                                                isSecondSendItemSelected =
                                                                    false;
                                                                isThirdSendItemSelected =
                                                                    false;
                                                                isFourSendItemSelected =
                                                                    true;
                                                                isFiveSendItemSelected =
                                                                    false;
                                                                setState(() {});
                                                                await feature
                                                                    .sendAllImages(
                                                                  widget.product
                                                                          .id ??
                                                                      '',
                                                                  feature
                                                                      .getGallery,
                                                                );

                                                                isFourSendItemSelected =
                                                                    false;
                                                                setState(() {});
                                                              },
                                                              name: 'All Image',
                                                              colorChangeBool:
                                                                  isFourSendItemSelected,
                                                              imageLength:
                                                                  feature
                                                                      .getGallery
                                                                      .length,
                                                              numberOfImageProcess:
                                                                  feature
                                                                      .getImageProcess,
                                                            ),
                                                            sendMethod(
                                                                () async {
                                                              isFirstSendItemSelected =
                                                                  false;
                                                              isSecondSendItemSelected =
                                                                  false;
                                                              isThirdSendItemSelected =
                                                                  false;
                                                              isFourSendItemSelected =
                                                                  false;
                                                              isFiveSendItemSelected =
                                                                  true;
                                                              setState(() {});

                                                              await Share.share(
                                                                  feature.getFeature +
                                                                      feature
                                                                          .getSpecialFeature);
                                                              isFiveSendItemSelected =
                                                                  false;
                                                              setState(() {});
                                                            }, 'Details',
                                                                isFiveSendItemSelected),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                              });
                                        },
                                      );
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
                                        // width4,
                                        // Text(
                                        //   "Share",
                                        //   style: TextStyle(
                                        //       fontSize: 12,
                                        //       fontWeight: FontWeight.w600,
                                        //       color: Colors.black,
                                        //       fontFamily: 'inter'),
                                        // ),
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
