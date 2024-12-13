import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../DTO/pbl_shop_dto.dart';
import '../../const/color.dart';
import '../../const/const_radio.dart';
import '../../provider/pbl_shop_provider.dart';
import '../../widget/customer_profile_bar.dart';
import '../../widget/search_text_field.dart';
import '../../widget/shimmer_effect/shimmer_effect.dart';
import 'pbl_shop_product.dart';

class PBLShop extends StatefulWidget {
  const PBLShop({super.key});

  @override
  State<PBLShop> createState() => _PBLShopState();
}

class _PBLShopState extends State<PBLShop> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true;
 // final PusherInstance pusherInstance = PusherInstance();

  bool isSearchVisible = true;
 // var socketMethod = SocketMethod();
 // late var socket = SocketManager().socket;
  SharedPreferences? preferences;
  String searchQuery = '';

  List? vehicleCollection = [];
  List<PBLShopDTO>? pblShopList = [];
  List? pblData;

  void printUserInfo() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  getDataProvider() async {
    // Capture the provider instance before the async operation
    final provider = Provider.of<PblShopProvider>(context, listen: false);

    // Perform the asynchronous operation
    await provider.getPBLShop();

    // Update the local list using the captured provider
    pblShopList = provider.getPBLShopList;

    // Ensure the widget is still mounted before calling setState
    if (!mounted) return;
    setState(() {});
  }

  initialize() async {
    printUserInfo();

    await getDataProvider();
  }

  @override
  void initState() {
    super.initState();
    initialize();

    //  fetchPhoneNumberAndPost();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // Scrolling down
        if (_isVisible) {
          setState(() {
            _isVisible = false; // Hide TextField
          });
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // Scrolling up
        if (!_isVisible) {
          setState(() {
            _isVisible = true; // Show TextField
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<PBLShopDTO>? filteredVehicle = [];
    filteredVehicle.clear();

    filteredVehicle = pblShopList?.where((vehicle) {
      return vehicle.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          vehicle.code!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomerProfileBar(
                profileImagePath: preferences?.getString('image') ??
                    'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/no-profile-picture-icon.png',
                merchantName: preferences?.getString('name') ?? '',
                phone: preferences?.getString('phone') ?? 'None',
                // sync_icon: '$iconPath/notification_outline.svg',
              ),
              InkWell(
                onTap: () async {
                  Uri phone = Uri.parse('tel:+8801969944400');
                  if (await launchUrl(phone)) {
                  } else {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Something went wrong. Please try again."),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: searchBarBorderColor),
                      color: Colors.grey),
                  child: const Center(
                    child: Text(
                      "Help : +8801969944400",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              height12,
              AnimatedSize(
                duration:
                    const Duration(milliseconds: 500), // Animation duration
                curve: Curves.easeInOut,
                child: _isVisible
                    ? SearchTextField(
                        hintText: 'Search',
                        searchController: searchController,
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value; // Update search query
                          });
                        },
                      )
                    : const SizedBox
                        .shrink(), // Use SizedBox.shrink() when hidden
              ),
              height12,
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    if (vehicleCollection?.length != null) {
                      vehicleCollection!.clear();
                      filteredVehicle!.clear();
                    }
                    initialize();
                  },
                  child: filteredVehicle?.isNotEmpty == true
                      ? ListView.builder(
                          controller: _scrollController,
                          primary: false,
                          shrinkWrap: true,
                          itemCount: filteredVehicle?.length,
                          itemBuilder: (context, index) {
                            (filteredVehicle == null ||
                                filteredVehicle.isEmpty);
                            PBLShopDTO? indexVehicleDTO =
                                filteredVehicle?[index];
                            if (indexVehicleDTO == null) {
                              return Container();
                            }
                            return PBLShopProduct(
                              product: indexVehicleDTO,
                            );
                          },
                        )
                      : ((filteredVehicle?.isEmpty == true) &&
                              (searchQuery.isNotEmpty))
                          ? const Center(
                              child: Text("Data not found"),
                            )
                          : ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return const ShimmerEffectForSingleVehicle(
                                  isShareOption: true,
                                );
                              },
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

loading() {
  return const SpinKitFadingCircle(
    size: 18,
    color: Colors.white,
  );
}

class SelectBottom extends StatelessWidget {
  const SelectBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 20,
        width: 20,
        decoration:
            const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        child: Center(
          child: Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}

class UnSelectedBottom extends StatelessWidget {
  const UnSelectedBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFABABAB)),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            )),
      ),
    );
  }
}
