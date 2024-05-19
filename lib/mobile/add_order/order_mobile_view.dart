import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../desktop/home/home_prov.dart';
import '../home/widget.dart';

class OrderViewMobile extends StatefulWidget {
  const OrderViewMobile({Key? key}) : super(key: key);
  @override
  _OrderViewMobileState createState() => _OrderViewMobileState();
}

class _OrderViewMobileState extends State<OrderViewMobile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Consumer<HomeProvDesktop>(
                builder: (context, value, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: width,
                            height: 600,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/background.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              MyTextMobile(
                                  fieldName: 'ادخل المعلومات الخاصه بك',
                                  fontSize: 30.r,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              SizedBox(
                                height: 20.h,
                              ),
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
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 800.h,
                            width: width,
                            color: Colors.white,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/background.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MyTextMobile(
                                        fieldName:
                                            'الشروط المقبوله في الطرف الاخر ',
                                        fontSize: 30.r,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextInputWidget(
                                    labelText: ' العمر ',
                                    hintText: 'من',
                                    controller:
                                        value.requestedAgeTextController,
                                  ),
                                  TextInputWidget(
                                    labelText: 'الطول',
                                    hintText: 'الطول',
                                    controller:
                                        value.requestedHeightTextController,
                                  ),
                                  TextInputWidget(
                                    labelText: 'الوزن',
                                    hintText: 'الوزن',
                                    controller:
                                        value.requestedWeightTextController,
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
                                    controller: value
                                        .requestedQualificationTextController,
                                  ),
                                  TextInputWidget(
                                    labelText: 'المدينه',
                                    hintText: 'المدينه',
                                    controller:
                                        value.requestedCityTextController,
                                  ),
                                  TextInputWidget(
                                    labelText: 'الجنسيه',
                                    hintText: 'الجنسيه',
                                    controller: value
                                        .requestedNationalityTextController,
                                  ),
                                  TextInputWidget(
                                    labelText: 'الوظيفه',
                                    hintText: 'الوظيفه',
                                    controller:
                                        value.requestedJobTextController,
                                  ),
                                  TextInputWidget(
                                    labelText: 'الحاله الماديه',
                                    hintText: 'الحاله الماديه',
                                    controller: value
                                        .requestedFinancialStateTextController,
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await value.sendOrder(context);
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: 130.w,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 4, 35, 60),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'ارسل الطلب',
                                          style: TextStyle(
                                            fontSize: 25.r,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: width,
                        // key: sendUskey,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                // Scrollable.ensureVisible(
                                // homeKey.currentContext!,
                                // duration: const Duration(seconds: 1500),
                                // );
                              },
                              child: Container(
                                height: 40,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xff4220A3),
                                ),
                                child: const Icon(
                                  Icons.expand_less,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
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
        width: 200.w,
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
