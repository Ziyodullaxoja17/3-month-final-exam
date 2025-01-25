import 'package:flutter/material.dart';
import 'package:flutter_3month_final_exam/presentation/widgets/custom_textfied.dart';
import 'package:flutter_3month_final_exam/provider/provider_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductScreen1 extends StatefulWidget {
  const ProductScreen1({super.key});

  @override
  State<ProductScreen1> createState() => _ProductScreen1State();
}

class _ProductScreen1State extends State<ProductScreen1> {
  final PageController pageController = PageController();

  int currentIndex = 0;
  List<dynamic> items = [1, 2, 3];
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() async {
      Provider.of<ProviderScreen>(context, listen: false).fetchFurniture();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<ProviderScreen>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFiellWidget(
                    emailController: textEditingController,
                    label: "Search",
                    hint_text: "Furniture",
                    icon_prefs: Icon(Icons.search)),
                SizedBox(
                  height: 10.h,
                ),

                // sizedboxga oralgan page viewlar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                    height: 200,
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      children: [
                        // sized box 1
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/home_fur.png",
                            fit: BoxFit.cover,
                          ),
                        ),

                        // sizedbox 2

                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/home_fur.png",
                            fit: BoxFit.cover,
                          ),
                        ),

                        // sizedbox 3
                        SizedBox(
                          width: double.infinity - 10.w,
                          child: Image.asset(
                            "assets/images/home_fur.png",
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // bu yerga biz qolgan tag qismini chizamiz

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Special offers",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.sp),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "See more",
                            style: TextStyle(
                                fontSize: 8.sp,
                                color: const Color.fromARGB(255, 38, 138, 90)),
                          ))
                    ],
                  ),
                ),
                // bu yerda eng pastdagi scrool qilinadigan listviewbuilder ni joylashtiramiz

                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: provider.furnitures.length,
                //   itemBuilder: (context, index) {
                //     final funtiture = provider.furnitures[index];

                //     return Container(
                //       child: Text(funtiture.name),
                //     );
                //   },
                // )
              ],
            ),
          );
        },
      ),
    ));
  }
}
