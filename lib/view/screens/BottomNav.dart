import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import 'add_account_screen.dart';
import 'my_accounts_screen.dart';
import 'news_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;

  late MyAccounts my;
  late AddAccount add;
  late News newss;
  int currentTabIndex=0;

  @override

  void initState() {
    my = MyAccounts();
    add= AddAccount();
    newss= News();
    pages= [my,add,newss];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: rmaincolor,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex=index;
          });
        },
        items: [
          Icon(Icons.account_balance,color: rbackgroundcolor,
          ),
           Icon(Icons.person_add_alt_1,color: rbackgroundcolor,
           ),
          Icon(Icons.newspaper,color: rbackgroundcolor,
          ),
        ],),
      body: pages[currentTabIndex],
    );
  }
}

