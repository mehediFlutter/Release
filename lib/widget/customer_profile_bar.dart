import 'package:flutter/material.dart';

import '../const/const_radio.dart';

class CustomerProfileBar extends StatefulWidget {
  final String profileImagePath;
  final String? syncIcon;
  final String? merchantName;
  final String? phone;
  final String? chatAbater;
  final bool isChatAbater;
  final Function()? onTapFunction;
  final Function()? chatTap;
  final Function()? drawerTap;
  final Widget? searchWidget;
  final bool isChatScreen;
  const CustomerProfileBar({
    super.key,
    required this.profileImagePath,
    this.onTapFunction,
    this.chatTap,
    this.syncIcon,
    this.drawerTap,
    this.merchantName,
    this.phone,
    this.chatAbater,
    this.isChatAbater = false,
    this.searchWidget,
    this.isChatScreen = false,
  });

  @override
  State<CustomerProfileBar> createState() => _CustomerProfileBarState();
}

class _CustomerProfileBarState extends State<CustomerProfileBar>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
//  var socketMethod = SocketMethod();
  bool isSearchTap = false;
// Current rotation angle
  late AnimationController _controller;
  loadUserInfo() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000), // Animation duration
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  void rotateImage() {
    setState(() {
// Rotate 90 degrees (1.57 radians)
    });
    _controller.forward(from: 0.0); // Start animation
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(children: [
        //  SearchTextField(searchController: searchController),
        Row(
          children: [
            Row(
              children: [
                Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      borderRadius: borderRadios10,
                    ),
                    child: Image.network(widget.profileImagePath)),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.merchantName ?? 'None',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.phone ?? 'None',
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            width15,
           // const Spacer(),
          //  widget.isChatScreen ? const RotatingImage() : const SizedBox(),
          ],
        ),
      ]),
    );
  }
}
