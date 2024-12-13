import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:release/screens/new_single_screen/new_single_products.dart';
import 'package:release/widget/shimmer_effect/shimmer_effect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../const/color.dart';
import '../../../const/path.dart';
import '../../../const/permission.dart';
import '../../../widget/search_text_field.dart';
import '../../DTO/get_all_vehicle_dao.dart';
import '../../const/const_radio.dart';
import '../../provider/socket_method_provider.dart';
import '../../widget/customer_profile_bar.dart';

class NewSingleScreenVehicle extends StatefulWidget {
  const NewSingleScreenVehicle({super.key});

  @override
  State<NewSingleScreenVehicle> createState() => _NewSingleScreenVehicleState();
}

class _NewSingleScreenVehicleState extends State<NewSingleScreenVehicle> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true;
 // final PusherInstance pusherInstance = PusherInstance();

  bool isSearchVisible = true;
 // var socketMethod = SocketMethod();
 // late var socket = SocketManager().socket;
  SharedPreferences? preferences;
  String searchQuery = '';
  // fetchPhoneNumberAndPost() async {
  //   await socketMethod.fetchContacts();
  //   await socketMethod.postPhoneNumber();
  // }

  bool isVehicleAvailable = false;

  List<GetAllVehicleDTO>? vehicleCollection = [];
  getVehicleCollection() async {
    vehicleCollection?.clear();
    final provider = Provider.of<SocketMethodProvider>(context, listen: false);
    await provider.getVehicleCollectionMethod(context);

    vehicleCollection = provider.getVehicleCollection;
    isVehicleAvailable = provider.getIsEmptyHome;

    if (mounted) {
      setState(() {});
    }
  }

  String? name;
  void printUserInfo() async {
    preferences = await SharedPreferences.getInstance();
    final companyName = preferences?.getString('companyName');
    final userName = preferences?.getString('name');
    if (kDebugMode) {
      print("Company name ${preferences?.getString('companyName')}");
      print("Name : ${preferences?.getString('name')}");
    }

    setState(() {});

    if (companyName!.isEmpty) {
      name = userName;
    } else {
      name = companyName;
    }
  }

  List<String> permission = [];

  void loadPermission() async {
    final preferences = await SharedPreferences.getInstance();
    List<String>? storedList = preferences.getStringList('permission');

    if (storedList != null) {
      permission = storedList;

      isCreateManager = !permission.contains(cannotCreateManager);
      isDeleteManager = !permission.contains(cannotDeleteManager);

      isCreateAdmin = !permission.contains(cannotCreateAdmin);
      isDeleteAdmin = !permission.contains(cannotDeleteAdmin);

      isCreateEditor = !permission.contains(cannotCreateEditor);
      isDeleteEditor = !permission.contains(cannotDeleteEditor);

      isCreateCustomerCare = !permission.contains(cannotCreateCustomerCare);
      isDeleteCustomerCate = !permission.contains(cannotDeleteCustomerCare);

      isShowPurchasePrice = !permission.contains(cannotShowPurchasePrice);

      isApproveVehicle = !permission.contains(cannotApproveVehicle);
      isChangePrice = !permission.contains(cannotChangePrice);
      isDeleteVehicle = !permission.contains(cannotDeleteVehicle);
      isCreateVehicle = !permission.contains(cannotCreateVehicle);

      isChangeAdvanceOption = !permission.contains(cannotChangeAdvancedOption);
    }
  }

  void initialize() async {
    printUserInfo();
    await getVehicleCollection();
    loadPermission();
  }

  @override
  void initState() {
    super.initState();
    initialize();

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
    List<GetAllVehicleDTO>? filteredVehicle = [];
    filteredVehicle.clear();

    filteredVehicle = vehicleCollection?.where((vehicle) {
      return vehicle.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          vehicle.code!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    setState(() {});

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomerProfileBar(
                profileImagePath:
                    preferences?.getString('image') ?? noImageFound,

                merchantName: preferences?.getString('name'),
                phone: preferences?.getString('phone') ?? 'None',
                // sync_icon: '$iconPath/notification_outline.svg',
              ),
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
                    initialize(); // Call the refactored function
                  },
                  child: isVehicleAvailable
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Center(
                              child: Text(
                                "No Vehicle Available in Your Account",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            height5,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: InkWell(
                                onTap: () async {
                                  Uri phone = Uri.parse('tel:+8801969944400');
                                  if (await launchUrl(phone)) {
                                  } else {
                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Something went wrong. Please try again."),
                                      ),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 43,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: searchBarBorderColor),
                                        color: Colors.grey),
                                    child: const Center(
                                      child: Text(
                                        "Help : +8801969944400",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : filteredVehicle?.isNotEmpty == true
                          ? ListView.builder(
                              controller: _scrollController,
                              primary: false,
                              shrinkWrap: true,
                              itemCount: filteredVehicle?.length,
                              itemBuilder: (context, index) {
                                (filteredVehicle == null ||
                                    filteredVehicle.isEmpty);
                                GetAllVehicleDTO? vehicleDTO =
                                    filteredVehicle?[index];

                                if (vehicleDTO == null) {
                                  return Container();
                                }
                                return NewSingleScreenProduct(
                                  product: vehicleDTO,
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
