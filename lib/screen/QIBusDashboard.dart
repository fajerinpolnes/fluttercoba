
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qi_bus_prokit/utils/AppWidget.dart';
import 'package:qi_bus_prokit/utils/QiBusColors.dart';
import 'package:qi_bus_prokit/utils/QiBusImages.dart';

import '../main.dart';
import 'QIBusBooking.dart';
import 'QIBusHome.dart';
import 'QIBusMore.dart';
import 'QIBusPackages.dart';

class QIBusDashboard extends StatefulWidget {
  static String tag = '/QIBusDashboard';

  @override
  QIBusDashboardState createState() => QIBusDashboardState();
}

class QIBusDashboardState extends State<QIBusDashboard> {
  var isSelected = 0;
  final List<Widget> _children = [
    QIBusHome(),
    QIBusPackages(),
    QIBusBooking(),
    QIBusMore(),
  ];

  @override
  Widget build(BuildContext context) {
    changeStatusColor(qIBus_colorPrimary);

    return Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: context.cardColor,
            boxShadow: [
              BoxShadow(color: qIBus_ShadowColor, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          padding: EdgeInsets.only(left: 16.0, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              tabItem(0, qibus_ic_home_selected, qibus_ic_home),
              tabItem(1, qibus_ic_package_selected, qibus_ic_package),
              tabItem(2, qibus_ic_booking_selected, qibus_ic_booking),
              tabItem(3, qibus_ic_more_selected, qibus_ic_more),
            ],
          ),
        ),
        body: _children[isSelected]);
  }

  Widget tabItem(var pos, var icon, var icon1) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            isSelected = pos;
            QIBusHome();
          },
        );
      },
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: isSelected == pos
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: appStore.isDarkModeOn ? cardDarkColor : t1_colorPrimary_light,
              )
            : BoxDecoration(),
        child: Image.asset(isSelected == pos ? icon : icon1, width: 20, height: 20).paddingAll(4),
      ),
    );
  }
}
