import 'package:flutter/material.dart';
import 'package:flutter_3month_final_exam/data/service/network_service.dart';
import 'package:flutter_3month_final_exam/presentation/screens/splash_screen1.dart';
import 'package:flutter_3month_final_exam/provider/provider_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: Size(300, 800),
      child: ChangeNotifierProvider(
        create: (context) =>
            ProviderScreen(networkService: NetworkServiceCustom()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen1(),
        ),
      ),
    );
  }
}
