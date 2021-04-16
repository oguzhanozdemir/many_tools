library many_tools;

import 'package:flutter/material.dart';

enum MTDeviceType {
  MOBILE,
  TABLET,
  DESKTOP,
}

class MTScreen {
  //Get Device Width
  double width({BuildContext context}) => MediaQuery.of(context).size.width;

  //Get Device Height
  double height({BuildContext context}) => MediaQuery.of(context).size.height;

  //Get Device Aspect Ratio
  double aspectRatio({BuildContext context}) =>
      MediaQuery.of(context).size.aspectRatio;

  //Get Device Type for Responsive UI
  MTDeviceType deviceType({BuildContext context}) {
    if (MTScreen().width(context: context) < 650) {
      return MTDeviceType.MOBILE;
    } else if (MTScreen().width(context: context) >= 1100) {
      return MTDeviceType.DESKTOP;
    } else {
      return MTDeviceType.TABLET;
    }
  }

  //PRogress indicator ve altında loading yazan ya da editlenebilen bir widget döndürür.
  Widget loading({String title = "Loading.."}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MTString {
  /// Find key to currency
  ///
  /// * key : String currency small name like TRY, EUR, USD
  ///
  /// * return : Symbol of currency like ₺, $, €, if it isn't find in list return $
  String getCurrenySymbol({String key}) {
    Map<String, String> currencyMap = {};
    currencyMap["USD"] = "\$";
    currencyMap["EUR"] = "€";
    currencyMap["GBP"] = "£";
    currencyMap["TRY"] = "₺";
    currencyMap["CHF"] = "CHF";
    currencyMap["CNY"] = "¥";
    return currencyMap.containsKey(key) ? currencyMap[key] : "\$";
  }
}
