import 'package:flutter/material.dart';

class ConnectivityProvider with ChangeNotifier {
  bool isConnectedInternet = true;
 bool get getConnection => isConnectedInternet; 



}