import 'package:e_commerce/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../values/colors.dart';
import '../../values/vectors.dart';

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
              Theme(
                data: Theme.of(context).copyWith(
                  dividerTheme: DividerThemeData(
                    color: Color(0xff000000).withOpacity(0.30),
                  ),
                  iconTheme: IconThemeData(color: Colors.green),
                ),
                child: PopupMenuButton<int>(
                  elevation: 3,
                  initialValue: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                  ),
                  icon: Icon(
                    Icons.more_vert,
                    color: MyColors.blue,
                  ),
                  offset: Offset(-15.w, 50.h),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem<int>(
                        child: AppText(
                          text: "Sort by price",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      PopupMenuDivider(height: 0),
                      PopupMenuItem<int>(
                        child: Row(
                          children: [
                            AppText(
                              text: "Sort by date",
                              fontWeight: FontWeight.w500,
                            ),
                            Spacer(),
                            Icon(Icons.check)
                          ],
                        )
                      ),
                      PopupMenuDivider(height: 0),
                      PopupMenuItem<int>(
                        child: AppText(
                          text: "Remove all items",
                          fontWeight: FontWeight.w500,
                          color: MyColors.red,
                        ),
                      ),
                    ];
                  },
                ),
              ),
              SizedBox(width: 10.w,)
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
