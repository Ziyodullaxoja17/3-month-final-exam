import 'package:flutter/material.dart';
import 'package:flutter_3month_final_exam/presentation/screens/product_screen1.dart';
import 'package:flutter_3month_final_exam/presentation/screens/signUp_screen.dart';
import 'package:flutter_3month_final_exam/presentation/widgets/custom_textfied.dart';
import 'package:flutter_3month_final_exam/provider/provider_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      "Welcome back !",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    Text(
                      "Enter your email to start shopping and get awesome deals today",
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
                      icon_prefs: Icon(Icons.email),
                      emailController: emailController,
                      label: "Enter your email",
                      hint_text: "example@gmail.com"),
                  CustomTextFiellWidget(
                      icon_prefs: Icon(Icons.password),
                      emailController: passwordController,
                      label: "Enter password",
                      hint_text: "12345678"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot your password?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color.fromARGB(255, 8, 128, 98),
                      ),
                    ),
                  ),
                ],
              ),

              // textfieldan pastgi qismi

              GestureDetector(
                onTap: () async {
                  final result = await provider.login(
                      password: passwordController.text.trim().toString(),
                      email: emailController.text.trim().toString());
                  if (result) {
                    provider.fetchFurniture();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen1(),
                      ),
                    );
                  } else {
                    passwordController.clear();
                    emailController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login failed. Please try again.'),
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
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
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

              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't you have a account ?",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.blue.shade600),
                      ))
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
