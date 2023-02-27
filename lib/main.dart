import 'package:flutter/material.dart';
import 'package:vhem_copy/provider/cartProvider.dart';
import 'package:vhem_copy/provider/themeChanger.dart';
import './screens/homePage.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import './provider/productProvider.dart';
import './screens/descPage.dart';
import './screens/cartPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_)=>themeChanger()),
      ChangeNotifierProvider(create: (_)=>productProvider()),
      ChangeNotifierProvider(create: (_)=>Cart())],
      
      child: Builder(builder: (BuildContext context) {
      final themedata = Provider.of<themeChanger>(context);
      return Sizer(builder: ((context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themedata.thememode,
          theme: ThemeData(
            primarySwatch: buildMaterialColor(Colors.white),
            backgroundColor: buildMaterialColor(Colors.white)
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          home: const  homePage(),

          routes: {
            descPage.routename: (context) =>const descPage(),
            CartPage.routename: (context) => const CartPage() 

          },
        );
      }));
      })
    );
  }
}
