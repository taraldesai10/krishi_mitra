import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi_mitra/screens/agronomy_page.dart';
import 'package:krishi_mitra/screens/home_screen/home_page.dart';
import 'package:krishi_mitra/screens/mandi_page.dart';
import 'package:krishi_mitra/screens/more/more_page.dart';

class CommonBottomNavigation extends StatefulWidget {
  const CommonBottomNavigation({super.key});

  @override
  State<CommonBottomNavigation> createState() => _CommonBottomNavigationState();
}

class _CommonBottomNavigationState extends State<CommonBottomNavigation> {
  int page = 0;

  final List pages = [
    const HomePage(),
    const MandiPage(),
    const AgronomiPage(),
    const MorePage()
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: pages[page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60,
        items: const <Widget>[
          Icon(
            CupertinoIcons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          )
        ],
        color: Colors.green.shade700,
        buttonBackgroundColor: Colors.green[900],
        backgroundColor: Colors.transparent,
        animationCurve: Curves.ease,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
