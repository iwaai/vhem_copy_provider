
import 'package:flutter/material.dart';
class themeChanger with ChangeNotifier{

  var _theme = ThemeMode.light;
  ThemeMode get thememode => _theme;
  var isdark = false;
  void setTheme(){
    if(thememode == ThemeMode.light)
    {
      _theme =ThemeMode.dark;
      isdark =true;
    }
    else
    {
      _theme = ThemeMode.light;
      isdark = false;
    }
    //print(thememode);
    notifyListeners();
  }
  

  
}