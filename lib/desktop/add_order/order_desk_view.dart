import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';
import '../home/home_prov.dart';
import '../home/widget.dart';

class OrderViewDesk extends StatefulWidget {
  const OrderViewDesk({Key? key}) : super(key: key);
  @override
  _OrderViewDeskState createState() => _OrderViewDeskState();
}

class _OrderViewDeskState extends State<OrderViewDesk> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProv = Provider.of<HomeProvDesktop>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isLoading = false;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Container(
                width: width,
                height: 950.h,
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/background.jpg',
                    width: 125.r, // تحديد عرض الصورة
                    height: 125.r, //
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Consumer<HomeProvDesktop>(builder: (context, value, child) {
                return Container(
                  width: width,
                  height: 950.h,
                  color: const Color.fromARGB(114, 255, 255, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyText(
                                fieldName: 'ادخل المعلومات الخاصه بك',
                                fontSize: 30.r,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            MyText(
                                fieldName: 'الشروط المقبوله في الطرف الاخر ',
                                fontSize: 30.r,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              TextInputWidget(
                                labelText: 'الاسم',
                                hintText: 'الاسم',
                                controller: value.nameTextController,
                              ),
                              TextInputWidget(
                                labelText: 'العمر',
                                hintText: 'العمر',
                                controller: value.ageTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الطول',
                                hintText: 'الطول',
                                controller: value.heightTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الوزن',
                                hintText: 'الوزن',
                                controller: value.weightTextController,
                              ),
                              TextInputWidget(
                                labelText: 'اللون',
                                hintText: 'اللون',
                                controller: value.skinColorTextController,
                              ),
                              TextInputWidget(
                                labelText: 'المؤهل',
                                hintText: 'المؤهل',
                                controller: value.qualificationTextController,
                              ),
                              TextInputWidget(
                                labelText: 'المدينه',
                                hintText: 'المدينه',
                                controller: value.cityTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الجنسيه',
                                hintText: 'الجنسيه',
                                controller: value.nationalityTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الوظيفه',
                                hintText: 'الوظيفه',
                                controller: value.jobTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الحاله الماديه',
                                hintText: 'الحاله الماديه',
                                controller: value.financialStateTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الايميل',
                                hintText: 'ادخل الايميل للتواصل',
                                controller: value.emailTextController,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextInputWidget(
                                labelText: ' العمر ',
                                hintText: 'من',
                                controller: value.requestedAgeTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الطول',
                                hintText: 'الطول',
                                controller: value.requestedHeightTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الوزن',
                                hintText: 'الوزن',
                                controller: value.requestedWeightTextController,
                              ),
                              TextInputWidget(
                                labelText: 'لون البشره',
                                hintText: 'لون البشره',
                                controller:
                                    value.requestedSkinColorTextController,
                              ),
                              TextInputWidget(
                                labelText: 'المؤهل',
                                hintText: 'المؤهل',
                                controller:
                                    value.requestedQualificationTextController,
                              ),
                              TextInputWidget(
                                labelText: 'المدينه',
                                hintText: 'المدينه',
                                controller: value.requestedCityTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الجنسيه',
                                hintText: 'الجنسيه',
                                controller:
                                    value.requestedNationalityTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الوظيفه',
                                hintText: 'الوظيفه',
                                controller: value.requestedJobTextController,
                              ),
                              TextInputWidget(
                                labelText: 'الحاله الماديه',
                                hintText: 'الحاله الماديه',
                                controller:
                                    value.requestedFinancialStateTextController,
                              ),
                              SizedBox(
                                height: 120.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await value.sendOrder(context);
                        },
                        child: Container(
                          height: 50.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 4, 54, 95),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'ارسل الطلب',
                              style: TextStyle(
                                fontSize: 30.r,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 50.h,
        width: 120.w,
        child: TextField(
          textDirection: TextDirection.rtl,
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 4, 54, 95), width: 3),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
                fontSize: 22.r, color: const Color.fromARGB(255, 4, 54, 95)),
            hintStyle: TextStyle(
                fontSize: 22.r, color: const Color.fromARGB(114, 0, 0, 0)),
          ),
        ),
      ),
    );
  }
}
