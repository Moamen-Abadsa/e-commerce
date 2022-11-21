import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../models/product.dart';
import '../values/colors.dart';
import '../values/vectors.dart';
import 'app_text.dart';


class AppGridView extends StatelessWidget {

  late final List<Product> mostSelling;

  AppGridView({required this.mostSelling});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 212.h,
      child: GridView.builder(
        itemCount: mostSelling.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 19.w,
            mainAxisExtent: 141),
        itemBuilder: (context, index) {
          var product = mostSelling.map((e) => e).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 140.h,
                    width: 141.w,
                    decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      width: 111,
                      height: 136,
                      child: Image.asset(
                        product[index].image,
                      ),
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        color: Colors.transparent,
                        onPressed: () {},
                        icon: product[index].isFavourite
                            ? SvgPicture.asset(Vectors.fav)
                            : SvgPicture.asset(Vectors.un_fav)),
                    top: -8.h,
                    right: -6.h,
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              AppText(
                text: product[index].category,
                color: MyColors.blue,
              ),
              AppText(
                text: product[index].name,
              ),
              Row(
                children: [
                  AppText(
                    text: "USD${product[index].price}",
                    color: Color(0xff8FA1B4),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "USD${product[index].originalPrice}",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffF45959),
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
