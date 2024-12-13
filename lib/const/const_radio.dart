import 'package:flutter/material.dart';
import 'package:release/const/color.dart';

const BorderRadius borderRadios10 = BorderRadius.all(Radius.circular(10));
const BorderRadius borderRadios8 = BorderRadius.all(Radius.circular(8));
const BorderRadius borderRadios20 = BorderRadius.all(Radius.circular(20));
const Color borderRadios8Color = Color(0xFFEEEEEE);
const SizedBox height5 = SizedBox(height: 5);
const SizedBox height4 = SizedBox(height: 4);
const SizedBox height2 = SizedBox(height: 2);
const SizedBox height8 = SizedBox(height: 8);
const SizedBox height12 = SizedBox(height: 12);
const SizedBox height16 = SizedBox(height: 16);
const SizedBox height10 = SizedBox(height: 10);
const SizedBox height15 = SizedBox(height: 15);
const SizedBox height20 = SizedBox(height: 20);
const SizedBox height25 = SizedBox(height: 25);
const SizedBox height30 = SizedBox(height: 30);
const SizedBox height35 = SizedBox(height: 35);
const SizedBox height40 = SizedBox(height: 40);

const SizedBox width5 = SizedBox(width: 5);
const SizedBox width4 = SizedBox(width: 4);
const SizedBox width10 = SizedBox(width: 10);
const SizedBox width15 = SizedBox(width: 15);
const SizedBox width20 = SizedBox(width: 20);
Container horizontalLine = Container(
  height: 55,
  width: 2,
  decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
);

Container greenTolu = Container(
  height: 8,
  width: 8,
  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
);

Icon syncIcon = const Icon(
  Icons.sync,
  size: 15,
  color: syncIconColor,
);
Padding syncIconMethod() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3),
    child: syncIcon,
  );
}

OutlineInputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(10));
OutlineInputBorder focusBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(10));

// OutlineInputBorder errorBorder = OutlineInputBorder(
//     borderSide: const BorderSide(color: Colors.red),
//     borderRadius: BorderRadius.circular(10));
