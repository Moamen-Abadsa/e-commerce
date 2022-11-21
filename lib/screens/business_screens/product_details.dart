import 'package:e_commerce/values/images.dart';
import 'package:e_commerce/widgets/app_text.dart';
import 'package:e_commerce/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../values/colors.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
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
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffEAEAEA),
                    borderRadius: BorderRadius.all(
                      Radius.circular(9.r),
                    ),
                  ),
                  child: buildIconButton(),
                ),
              ],
            ),
            SizedBox(
              height: 11.w,
            ),
            Image.asset(
              Images.bracelets,
              height: 200.h,
              width: 287.w,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 23.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 190.w,
                  child: AppText(
                    text: "Montpellier White Chronograph Watch",
                    fontSize: 18.sp,
                  ),
                ),
                Spacer(),
                AppText(
                  text: "\$189",
                  fontSize: 20.sp,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Divider(
              thickness: 1.h,
              color: Colors.black.withOpacity(0.15),
            ),
            SizedBox(
              height: 23.h,
            ),
            AppText(
              text:
                  """Inspired by Scandinavian design and engineering, the ontpellier watch is a quality-built accessory for everyday wear. This handmade timepiece has crystal quartz movement, blue crocodile-embossed leather strap and silver water resistant stainless steel case.  Whether you slip it on solo or with a stack of  Grand Frank bangles, the result is timeless.""",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 20.h,),
            AppTextButton(text: "Add to Cart", onPressed: (){
              // save in preferences
            })
          ],
        ),
      ),
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          isFav = !isFav;
        });
      },
      icon: Icon(
        Icons.favorite,
        color: isFav ? Color(0xffF45959) : Colors.black26,
        size: 32.sp,
      ),
    );
  }
}
