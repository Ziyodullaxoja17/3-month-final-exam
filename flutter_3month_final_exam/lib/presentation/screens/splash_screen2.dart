import 'package:flutter/material.dart';
import 'package:flutter_3month_final_exam/presentation/screens/splash_screen3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.asset(
              width: double.infinity,
              height: 0.5.sh,
              'assets/images/home_fur.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                Text(
                  "Online Home Store and Furniture",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.sp, color: Colors.black.withOpacity(0.9)),
                ),
                Text(
                  "Discover all style and budgets of furniture, appliances, kitchen, and more from 500 brands in your hand.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.sp, color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreen3(),
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                height: 70.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: Color(0xff1A7F65),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
