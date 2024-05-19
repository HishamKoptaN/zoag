import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../colors.dart';
import 'home_prov.dart';
import 'widget.dart';

class HomeViewDesk extends StatefulWidget {
  final Function()? onTap;

  HomeViewDesk({
    super.key,
    required this.onTap,
  });

  @override
  _HomeViewDeskState createState() => _HomeViewDeskState();
}

class _HomeViewDeskState extends State<HomeViewDesk> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          height: 600.h,
          width: width,
          child: Container(
            width: width,
            height: 600.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  twoColor,
                  threeColor,
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 500.w,
                  height: 600.h,
                  child: Column(
                    children: [
                      SizedBox(
                        width: width,
                        height: 600.h,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 60.h,
                              right: 30.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  height: 450.r,
                                  width: 450.r,
                                  'assets/images/1st_page.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30.h,
                              left: 45.w,
                              child: SizedBox(
                                height: 600.h,
                                width: 150.w,
                                child: Column(
                                  children: [
                                    MyText(
                                      fieldName: 'اهلا بك , في منصة ازوأچ',
                                      fontSize: 65.r,
                                      color:
                                          const Color.fromARGB(255, 5, 27, 45),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    MyText(
                                      fieldName:
                                          'غايتنا وهدفنا السامي هو مساعدتك في البحث عن شريك الحياة المناسب لك',
                                      fontSize: 25.r,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100,
                                    ),
                                    SizedBox(
                                      height: 60.h,
                                    ),
                                    MyText(
                                      fieldName: 'ابدأ بالبحث علي شريك حياتك',
                                      fontSize: 35.r,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Consumer<HomeProvDesktop>(
                                      builder: (BuildContext context,
                                          HomeProvDesktop value,
                                          Widget? child) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: widget.onTap,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(80),
                                                child: Image.asset(
                                                  'assets/images/man.jpg',
                                                  width: 125.r,
                                                  height: 125.r,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: widget.onTap,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(80),
                                                child: Image.asset(
                                                  'assets/images/women.jpg',
                                                  width: 125.r,
                                                  height: 125.r,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextInputWidget extends StatelessWidget {
  String labelText;
  String hintText;
  TextEditingController controller;
  TextInputWidget(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 50,
      child: TextField(
        textDirection: TextDirection.rtl,
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }
}
