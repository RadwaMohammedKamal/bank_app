import 'package:flutter/material.dart';

import '../components/customAppbar.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "News" ),

    );
  }
}
