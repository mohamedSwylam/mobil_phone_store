import 'package:flutter/material.dart';
import 'package:store_app/modules/landingPage/landing_page.dart';
import 'package:store_app/network/local/cache_helper.dart';
import 'package:store_app/shared/components/components.dart';

class MyColors {
  static Color mainColor = Color(0xFF009603);
  static Color secondaryColor = Color(0xFF393236);
  static Color subTitle = Color(0xFF393236);
  static Color backgroundColor = Color(0xFF393236); //grey 300

  //Icon Colors
  static Color favColor = Color(0xFFF44336);
  static Color favBadgeColor = Color(0xFFE57373);
  static Color cartColor = Color(0xFF5E35B1);
  static Color cartBadgeColor = Color(0xFFBA68C8);

  //Gradients
  static Color gradientFStart = Color(0xFFE040FB);
  static Color gradientFEnd = Color(0xFFE1BEE7);
  static Color gradientLStart = Color(0xFFAA00FF);
  static Color gradientendLEnd = Color(0xFFAB47BC);

  static Color starterColor = Color(0xFF009603);
  static Color endColor = Color(0xFF56DA78);
  static Color endColor2 = Color(0xFFA0C2A9);
}
String uId='';
void signOut(context)=> CacheHelper.removeData(key: 'uId').then((value) {
  if(value){
    navigateAndFinish(context, LandingPage());
  }
});