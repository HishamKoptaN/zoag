import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget.dart';

class HomeViewMobile extends StatefulWidget {
  final Function()? onTap;

  HomeViewMobile({
    super.key,
    required this.onTap,
  });

  @override
  _HomeViewMobileState createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          height: 1100.h,
          width: width,
          child: Container(
            width: width,
            height: 1100.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 83, 169, 238),
                  Color.fromARGB(255, 66, 135, 245)
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextMobile(
                  fieldName: 'اهلا, بك في منصة ازواج',
                  fontSize: 50.r,
                  color: const Color.fromARGB(255, 5, 27, 45),
                  fontWeight: FontWeight.bold,
                ),
                MyTextMobile(
                  fieldName: 'اعثر علي شريك حياة به كل المواصفات التي تريدها',
                  fontSize: 25.r,
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                ),
                SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      'assets/1st page.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 250.r,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Column(
                          children: [
                            MyTextMobile(
                              fieldName: 'ابدأ بالعثور علي شريكة حياتك',
                              fontSize: 20.r,
                              color: Colors.black,
                              fontWeight: FontWeight.w100,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Image.network(
                                'assets/man.jpg',
                                width: 125.r, // تحديد عرض الصورة
                                height: 125.r, //
                                fit: BoxFit.fill,
                              ),
                            ),
                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            // Image.network(
                            //   'assets/previous.png',
                            //   width: 60.r,
                            //   height: 30.r,
                            //   fit: BoxFit.cover,
                            // ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Column(
                          children: [
                            MyTextMobile(
                              fieldName: 'ابدأي بالعثور علي شريك حياتك',
                              fontSize: 20.r,
                              color: Colors.black,
                              fontWeight: FontWeight.w100,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  80), // تحديد نسبة الحواف
                              child: Image.network(
                                'assets/women.jpg', // استبدلها بمسار الصورة الخاص بك
                                width: 125.r, // تحديد عرض الصورة
                                height: 125.r, // تحديد ارتفاع الصورة
                                fit: BoxFit
                                    .cover, // لتغطية الصورة بالشكل المناسب
                              ),
                            ),
                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            // Image.network(
                            //   'assets/previous.png',
                            //   width: 60.r,
                            //   height: 30.r,
                            //   fit: BoxFit.cover,
                            // ),
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
