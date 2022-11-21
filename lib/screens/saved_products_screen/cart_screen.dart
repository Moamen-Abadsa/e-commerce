import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../values/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            leadingWidth: 100.w,
            actions: [
              DropdownButton(
                items: [],
                onChanged: (value) {},
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                "assets/vectors/back_arrow.svg",
              ),
              label: Text(
                "Back",
                style: TextStyle(color: MyColors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
