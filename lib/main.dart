import 'package:flutter/material.dart';
import 'package:make_up_flutter/ui/home_screen.dart';
import 'package:make_up_flutter/viewmodel/cart_model.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
     ChangeNotifierProvider(
      create: (_)=>CartModel(),
        child: const MaterialApp(home: HomeScreen())),
  );
}

