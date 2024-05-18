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

TextEditingController nameTextController = TextEditingController();
TextEditingController ageTextController = TextEditingController();
TextEditingController heightTextController = TextEditingController();
TextEditingController weightTextController = TextEditingController();
TextEditingController skinColorTextController = TextEditingController();
TextEditingController qualificationTextController = TextEditingController();
TextEditingController cityTextController = TextEditingController();
TextEditingController nationalityTextController = TextEditingController();
TextEditingController jobTextController = TextEditingController();
TextEditingController financialStateTextController = TextEditingController();
TextEditingController emailTextController = TextEditingController();

TextEditingController requestedAgeTextController = TextEditingController();

TextEditingController requestedHeightTextController = TextEditingController();
TextEditingController requestedWeightTextController = TextEditingController();
TextEditingController requestedSkinColorTextController =
    TextEditingController();
TextEditingController requestedQualificationTextController =
    TextEditingController();
TextEditingController requestedCityTextController = TextEditingController();
TextEditingController requestedNationalityTextController =
    TextEditingController();
TextEditingController requestedJobTextController = TextEditingController();
TextEditingController requestedFinancialStateTextController =
    TextEditingController();

final List<Widget> _pages = [
  TextInputWidget(
    labelText: 'الاسم',
    hintText: 'الاسم',
    controller: nameTextController,
  ),
  TextInputWidget(
    labelText: 'العمر',
    hintText: 'العمر',
    controller: ageTextController,
  ),
  TextInputWidget(
    labelText: 'الطول',
    hintText: 'الطول',
    controller: heightTextController,
  ),
  TextInputWidget(
    labelText: 'الوزن',
    hintText: 'الوزن',
    controller: weightTextController,
  ),
  TextInputWidget(
    labelText: 'اللون',
    hintText: 'اللون',
    controller: skinColorTextController,
  ),
  TextInputWidget(
    labelText: 'المؤهل',
    hintText: 'المؤهل',
    controller: qualificationTextController,
  ),
  TextInputWidget(
    labelText: 'المدينه',
    hintText: 'المدينه',
    controller: cityTextController,
  ),
  TextInputWidget(
    labelText: 'الجنسيه',
    hintText: 'الجنسيه',
    controller: nationalityTextController,
  ),
  TextInputWidget(
    labelText: 'الوظيفه',
    hintText: 'الوظيفه',
    controller: jobTextController,
  ),
  TextInputWidget(
    labelText: 'الحاله الماديه',
    hintText: 'الحاله الماديه',
    controller: financialStateTextController,
  ),
  TextInputWidget(
    labelText: 'الايميل',
    hintText: 'ادخل الايميل للتواصل',
    controller: financialStateTextController,
  ),
];
void selectFirstImagePath() {
  Dialogs.materialDialog(
    context: Get.context!,
    title: 'اختر مسار الملفات',
    msg: 'حدد من اين تفضل اضافة الملفات ',
    titleStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    msgStyle: const TextStyle(
      fontSize: 17,
    ),
    actions: [
      IconsOutlineButton(
        onPressed: () async {
          Navigator.pop(Get.context!);
        },
        text: 'الكاميرا',
        iconData: CupertinoIcons.camera_fill,
        textStyle: const TextStyle(color: Colors.white),
        color: Colors.amber,
        iconColor: Colors.white,
      ),
      IconsButton(
        onPressed: () async {
          Navigator.pop(Get.context!);
        },
        text: 'الاستديو',
        iconData: CupertinoIcons.photo_on_rectangle,
        color: Colors.amber,
        textStyle: const TextStyle(color: Colors.white),
        iconColor: Colors.white,
      ),
    ],
  );
}

Future<void> sendOrder() async {
  try {
    // قم بتحديث Firestore ببيانات الطلب
    await FirebaseFirestore.instance.collection('orders').doc().set({
      "requester_data": {
        'requester_name': nameTextController.text,
        'requester_age': ageTextController.text,
        'requester_height': heightTextController.text,
        'requester_weight': weightTextController.text,
        'requester_skin_color': skinColorTextController.text,
        'requester_qualification': qualificationTextController.text,
        'requester_city': cityTextController.text,
        'requester_nationality': nationalityTextController.text,
        'requester_job': jobTextController.text,
        'requester_financial': financialStateTextController.text,
        'email': emailTextController.text,
      },
      "requested_data": {
        'requested_age': ageTextController.text,
        'requested_height': heightTextController.text,
        'requested_weight': weightTextController.text,
        'requested_skin_color': skinColorTextController.text,
        'requested_qualification': qualificationTextController.text,
        'requested_city': cityTextController.text,
        'requested_nationality': nationalityTextController.text,
        'requested_job': jobTextController.text,
        'requested_financial': financialStateTextController.text,
      },
    });
  } catch (e) {
    print(e);
  }
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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Container(
                height: 1000,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("assets/small_image.jpeg"),
                    ),
                  ),
                ),
              ),
              Container(
                width: width,
                height: 900.h,
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
                              controller: nameTextController,
                            ),
                            TextInputWidget(
                              labelText: 'العمر',
                              hintText: 'العمر',
                              controller: ageTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الطول',
                              hintText: 'الطول',
                              controller: heightTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الوزن',
                              hintText: 'الوزن',
                              controller: weightTextController,
                            ),
                            TextInputWidget(
                              labelText: 'اللون',
                              hintText: 'اللون',
                              controller: skinColorTextController,
                            ),
                            TextInputWidget(
                              labelText: 'المؤهل',
                              hintText: 'المؤهل',
                              controller: qualificationTextController,
                            ),
                            TextInputWidget(
                              labelText: 'المدينه',
                              hintText: 'المدينه',
                              controller: cityTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الجنسيه',
                              hintText: 'الجنسيه',
                              controller: nationalityTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الوظيفه',
                              hintText: 'الوظيفه',
                              controller: jobTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الحاله الماديه',
                              hintText: 'الحاله الماديه',
                              controller: financialStateTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الايميل',
                              hintText: 'ادخل الايميل للتواصل',
                              controller: emailTextController,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TextInputWidget(
                              labelText: ' العمر ',
                              hintText: 'من',
                              controller: requestedAgeTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الطول',
                              hintText: 'الطول',
                              controller: requestedHeightTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الوزن',
                              hintText: 'الوزن',
                              controller: requestedWeightTextController,
                            ),
                            TextInputWidget(
                              labelText: 'لون البشره',
                              hintText: 'لون البشره',
                              controller: requestedSkinColorTextController,
                            ),
                            TextInputWidget(
                              labelText: 'المؤهل',
                              hintText: 'المؤهل',
                              controller: requestedQualificationTextController,
                            ),
                            TextInputWidget(
                              labelText: 'المدينه',
                              hintText: 'المدينه',
                              controller: requestedCityTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الجنسيه',
                              hintText: 'الجنسيه',
                              controller: requestedNationalityTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الوظيفه',
                              hintText: 'الوظيفه',
                              controller: requestedJobTextController,
                            ),
                            TextInputWidget(
                              labelText: 'الحاله الماديه',
                              hintText: 'الحاله الماديه',
                              controller: requestedFinancialStateTextController,
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
                        // await sendOrder();
                        selectFirstImagePath();
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
              ),

              // Expanded(
              //   child: PageView.builder(
              //     physics: const NeverScrollableScrollPhysics(),
              //     scrollDirection: Axis.vertical,
              //     controller: homeProv.pageController,
              //     itemCount: 10,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         decoration: const BoxDecoration(),
              //         child: Container(
              //           color: const Color.fromARGB(183, 255, 255, 255),
              //           child: Center(
              //             child: _pages[homeProv.currentPage],
              //           ),
              //         ),
              //       );
              //     },
              //     onPageChanged: (index) {
              //       homeProv.currentPage = index;
              //     },
              //   ),
              // ),
              // Positioned(
              //   bottom: 85.h,
              //   right: 0.w,
              //   left: 0.w,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           homeProv.nextPage();
              //         },
              //         child: Container(
              //           height: 50.h,
              //           width: 30.w,
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               Icon(
              //                 Icons.arrow_back,
              //                 color: Colors.black,
              //                 size: 30.r,
              //               ),
              //               MyText(
              //                 fieldName: 'التالي',
              //                 fontSize: 20.r,
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       SizedBox(width: 120.w),
              //       GestureDetector(
              //         onTap: () {
              //           homeProv.previousPage();
              //         },
              //         child: Container(
              //           height: 50.h,
              //           width: 30.w,
              //           decoration: BoxDecoration(
              //             color: const Color.fromARGB(255, 4, 38, 65),
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               MyText(
              //                 fieldName: 'السابق',
              //                 fontSize: 20.r,
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //               Icon(
              //                 Icons.arrow_forward,
              //                 color: Colors.white,
              //                 size: 30.r,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
