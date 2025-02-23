import 'package:bank_app/view/components/show_toaster.dart';
import 'package:bank_app/view/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import 'navigate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: rmaincolor,
      title: Text(title ,
        style: TextStyle(
        fontSize: 30,
          fontWeight: FontWeight.bold,
            color: Colors.white
      ),),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout , color: rbackgroundcolor, size: 30,),
          onPressed: () {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(content: Text("تم تسجيل الخروج")),
            // );
            showtoaster(color: Colors.green,msg: '  Log Out Successfully  ');
            navigateAndFinish(context,LoginScreen());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); //لتعريف Scaffold بارتفاع appbar
}
