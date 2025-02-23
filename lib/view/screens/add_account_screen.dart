import 'package:flutter/material.dart';

import '../components/customAppbar.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Account" ),

    );
  }
}
