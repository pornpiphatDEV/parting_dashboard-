import 'dart:convert';

import 'package:budget_tracker_ui/pages/budget_page.dart';
import 'package:budget_tracker_ui/pages/create_budge_page.dart';
import 'package:budget_tracker_ui/pages/daily_page.dart';
import 'package:budget_tracker_ui/pages/profile_page.dart';
import 'package:budget_tracker_ui/pages/stats_page.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:budget_tracker_ui/providers/counter.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  List<Widget> pages = [
    DailyPage(),
    StatsPage(),
    BudgetPage(),
    ProfilePage(),
    CreatBudgetPage()
  ];

  // Future<String> getData() async {
  //   // print(datacount);
  //   var url = Uri.parse(
  //       'https://random-data-api.com/api/cannabis/random_cannabis?size=30');
  //   var response = await http.get(url);
  //   print(response.body);
  //   var user = jsonDecode(response.body);
  //   print(user);
  //   return "Success!";
  // }

  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // getData();
    print("test1");
  }

  VoidCallback callBack() {
    print("test2");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              selectedTab(4);
            },
            child: Icon(
              Icons.car_repair,
              size: 25,
            ),
            backgroundColor: Colors.green
            //params
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_qr_scanner,
      Ionicons.ios_timer,
      Ionicons.ios_person,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: Colors.green,
      splashColor: Colors.green,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        // print(index);
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    // notifyListeners();s
    print(index);
    _incrementCounter(context);

    setState(() {
      pageIndex = index;
    });
  }
}
