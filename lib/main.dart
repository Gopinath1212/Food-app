import 'package:fast_food_app/ui/home/home_widgets.dart';
import 'package:fast_food_app/ui/home/homepage.dart';
import 'package:fast_food_app/ui/home/tabs/pizzza/remix_pizza/remix_pizza.dart';
import 'package:fast_food_app/ui/home/tabs/smoothie/smoothie_tab/smoothie_tab.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

void main() {
  runApp(const FastFoodApp());
}

class FastFoodApp extends StatelessWidget {
  const FastFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home:  LoginScreen(),
    );
  }
}
