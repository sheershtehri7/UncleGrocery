import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss_e_commerce/Pages/CategoriesPage.dart';
import 'package:ss_e_commerce/Pages/CategoryNav.dart';
import 'package:ss_e_commerce/Pages/accountspage.dart';
import 'package:ss_e_commerce/Pages/homepage.dart';
import 'package:ss_e_commerce/Pages/mycartpage.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Homescreen(),
    Categorynav(),
    Cartpage(),
    Accountspage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: MediaQuery.of(context).size.height * 0.075,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 235, 235, 41),
        color: const Color.fromARGB(255, 255, 255, 255),
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.home),
          Icon(CupertinoIcons.cube_box),
          Icon(Icons.shopping_cart_checkout_outlined),
          Icon(CupertinoIcons.profile_circled),
        ],
      ),
    );
  }
}
