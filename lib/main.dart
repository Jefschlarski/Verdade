import 'package:flutter/material.dart';
import 'package:verdade/views/fav_list/fav_screen.dart';
import 'package:provider/provider.dart';
import 'package:verdade/views/home_screen.dart';
import 'package:verdade/views/menu/menu_fragment.dart';
import 'package:verdade/views/menu/menu_provider.dart';
import 'views/on_boarding_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MenuProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: OnboardingScreen(),
        home: Scaffold(
      body: Stack(
        children: [
          HomeScreen(),
          Align(
            alignment: Alignment.bottomCenter,
            child: MenuFragment(),
          )
        ],
      ),
    ));
  }
}
