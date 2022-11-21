import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/vectors.dart';
import 'package:e_commerce/widgets/app_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/product.dart';
import '../../values/images.dart';
import '../../widgets/app_grid_view.dart';
import '../../widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;


// let us go, you
  TextStyle selectedBottomNavTextStyle = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w600, fontFamily: "poppins");
  TextStyle unselectecBottomNavTextStyle = TextStyle(
      fontSize: 12.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500);

  // 0 -> watches , 1 -> Bracelets , 2 -> Starps , 3 -> Set
  List<bool> categoriesClick = [false, false, false, false];

  List<Product> mostSelling = [
    Product(
        id: "1",
        category: "55555",
        name: "5555",
        price: 32,
        originalPrice: 56,
        isFavourite: true,
        image: Images.bracelets),
    Product(
        id: "2",
        category: "55555",
        name: "5555",
        price: 55,
        originalPrice: 89,
        isFavourite: false,
        image: Images.bracelets)
  ];


  late Product product;

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    AppText(text: "Select from categories", fontSize: 18.sp),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/vectors/search_icon.svg"),
                    ),
                    SizedBox(
                      width: 21.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 15.5.h,
                ),
                Row(
                  children: [
                    AppChip(
                        text: "Watches",
                        onTap: () {
                          setState(() {
                            categoriesClick[0] = !categoriesClick[0];
                          });
                        },
                        isClick: categoriesClick[0]),
                    SizedBox(width: 15.w),
                    AppChip(
                        text: "Bracelets",
                        onTap: () {
                          setState(() {
                            categoriesClick[1] = !categoriesClick[1];
                          });
                        },
                        isClick: categoriesClick[1]),
                    SizedBox(width: 15.w),
                    AppChip(
                      text: "Straps",
                      onTap: () {
                        setState(() {
                          categoriesClick[2] = !categoriesClick[2];
                        });
                      },
                      isClick: categoriesClick[2],
                    ),
                    SizedBox(width: 15.w),
                    AppChip(
                      text: "Set",
                      onTap: () {
                        setState(() {
                          categoriesClick[3] = !categoriesClick[3];
                        });
                      },
                      isClick: categoriesClick[3],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                AppText(text: "Most Selling", fontSize: 18.sp),
                Spacer(),
                AppText(
                  text: "View All",
                  fontSize: 14.sp,
                  color: MyColors.blue,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 31.5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Column(
              children: [
                AppGridView(mostSelling: mostSelling),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  children: [
                    AppText(
                      text: "Recent Added",
                      fontSize: 18,
                    ),
                    Spacer(),
                    AppText(
                      text: "View All",
                      color: MyColors.blue,
                    ),
                    SizedBox(
                      width: 30.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                AppGridView(mostSelling: mostSelling)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedLabelStyle: selectedBottomNavTextStyle,
      fixedColor: MyColors.blue,
      unselectedLabelStyle: unselectecBottomNavTextStyle,
      unselectedItemColor: Color(0xffC0C0C0),
      type: BottomNavigationBarType.fixed,

      onTap: (index){
        setState(() {
          _selectedIndex = index;
        });
      },
      currentIndex: _selectedIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset("assets/vectors/home.svg",),
          label: "Home",
          icon: SvgPicture.asset(Vectors.unselected_home),
        ),
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(Vectors.cart),
            icon: SvgPicture.asset(Vectors.unselected_cart),
            label: "Cart"),
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(Vectors.fav_bottom_icon),
            icon: SvgPicture.asset(Vectors.unselected_fav),
            label: "Favourite"),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(Vectors.profile_icon),
          icon: SvgPicture.asset(Vectors.unselected_profile),
          label: "Profile",
        ),
      ],
    );
  }
}
