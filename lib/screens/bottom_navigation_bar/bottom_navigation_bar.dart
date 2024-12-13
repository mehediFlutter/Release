import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/path.dart';
import '../../user/user_screen.dart';
import '../pbl_shop/pbl_shop.dart';

class BottomNavBaseScreen extends StatefulWidget {
  final int? isRequiredIndex;
  const BottomNavBaseScreen({super.key, this.isRequiredIndex});

  @override
  BottomNavBaseScreenState createState() => BottomNavBaseScreenState();
}

class BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  int? _selectedIndex;
  final List<Widget> _screens = [
  //  const NewSingleScreenVehicle(),
  const PBLShop(),
    //  TabChat(),
    // const PBLShop(),
    const UserScreen(),
    // VideoUploadScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  initState() {
    setState(() {
      _selectedIndex = widget.isRequiredIndex ?? 0;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex!],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            border: Border.all(color: const Color(0xFFEEEEEE))),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex!,
            onTap: _onItemTapped,
            selectedItemColor:
                Colors.black, // Color for selected item (label and icon)
            unselectedItemColor:
                Colors.grey, // Color for unselected item (label and icon)
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _selectedIndex == 0
                      ? '$iconPath/new_home_filled.svg'
                      : '$iconPath/new_home_outline.svg',
                ),
                label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   icon: SvgPicture.asset(
              //     _selectedIndex == 1
              //         ? '$iconPath/new_reals_2filled.svg'
              //         : '$iconPath/new_reals_2outline.svg',
              //   ),
              //   label: 'Reel',
              // ),
              // BottomNavigationBarItem(
              //   icon: SvgPicture.asset(
              //     _selectedIndex == 1 //new_chat_filled.svg
              //         ? '$iconPath/new_chat_filled.svg'
              //         : '$iconPath/new_chat_outline.svg',
              //   ),
              //   label: 'Chat',
              // ),
              // BottomNavigationBarItem(
              //   icon: SvgPicture.asset(
              //     _selectedIndex == 1 //new_chat_filled.svg
              //         ? '$iconPath/shop_filled.svg'
              //         : '$iconPath/shop_outline.svg',
              //   ),
              //   label: 'PBL Shop',
              // ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _selectedIndex == 1
                      ? '$iconPath/new_person_filled.svg'
                      : '$iconPath/new_person_outline.svg',
                ),
                label: 'User',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
