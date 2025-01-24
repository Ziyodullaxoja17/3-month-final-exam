import 'package:flutter/material.dart';
import 'package:flutter_3month_final_exam/presentation/screens/product_screen1.dart';
import 'package:flutter_3month_final_exam/presentation/widgets/custom_textfied.dart';
import 'package:flutter_3month_final_exam/provider/provider_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController lastname_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderScreen>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              // tepadagi 2 ta text
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Account !",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    Text(
                      "Fill in your details below to get started on a seamless shopping experiemce.",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  CustomTextFiellWidget(
                      icon_prefs: Icon(Icons.person),
                      emailController: name_controller,
                      label: "First name",
                      hint_text: "John"),
                  CustomTextFiellWidget(
                      icon_prefs: Icon(Icons.person),
                      emailController: lastname_controller,
                      label: "Last name",
                      hint_text: "William"),
                  CustomTextFiellWidget(
                      icon_prefs: Icon(Icons.email),
                      emailController: email_controller,
                      label: "Email",
                      hint_text: "example@gmail.com"),
                  CustomTextFiellWidget(
                      icon_prefs: Icon(Icons.password),
                      emailController: password_controller,
                      label: "Password",
                      hint_text: "12345678"),
                ],
              ),

              SizedBox(
                height: 30.h,
              ),

              // textfieldan pastgi qismi

              GestureDetector(
                onTap: () async {
                  final result = await provider.register(
                      password: password_controller.text.trim().toString(),
                      email: email_controller.text.trim().toString());
                  if (result) {
                    await provider.fetchFurniture();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen1(),
                      ),
                    );
                  } else {
                    password_controller.clear();
                    email_controller.clear();
                    name_controller.clear();
                    lastname_controller.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Register failed. Please try again.'),
                      ),
                    );
                    provider.refresh();
                  }
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
                    "Create a account",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60.h,
                child: Text("OR"),
              ),

              Column(
                spacing: 10.h,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 200.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(
                            width: 1.sp,
                            color: const Color.fromARGB(255, 23, 74, 175)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Login in  with Google",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Container(
                      width: 200.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(
                            width: 1.sp,
                            color: const Color.fromARGB(255, 16, 100, 185)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Login in with Facebook",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
