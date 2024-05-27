import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants/responsive.dart';
import '../main.dart';
import 'aii_widgets.dart';
import 'provider/home_prov.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SizedBox(
          height: 500,
          width: 500,
          child: Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider value, Widget? child) {
              return Expanded(
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            controller: value.scrollController,
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                HomeWidget(
                                  key: value.homeKey,
                                  width: width,
                                  height: height,
                                  onTap: () {
                                    value.scrollTo(value.firstNameRequesterKey);
                                  },
                                ),
                                SizedBox(
                                  key: value.firstNameRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Center(
                                    child: PageData(
                                      textEditingController: value
                                          .firstNameRequesterTextController,
                                      width: width,
                                      height: height,
                                      textSpan: 'ألاسم',
                                      labelText: 'إدخل ألاسم',
                                      isMandatory: false,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  key: value.secondNameRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Center(
                                    child: PageData(
                                      textEditingController: value
                                          .secondNameRequesterTextController,
                                      width: width,
                                      height: height,
                                      textSpan: 'أسم ألاب',
                                      labelText: 'إدخل أسم ألاب',
                                      isMandatory: false,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  key: value.titleRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Center(
                                    child: PageData(
                                      textEditingController:
                                          value.titleRequesterTextController,
                                      width: width,
                                      height: height,
                                      textSpan: 'اللقب',
                                      labelText: 'إدخل اللقب',
                                      isMandatory: false,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  key: value.mobileNumberRequesterKey,
                                  height: height,
                                  width: width,
                                  child: Center(
                                    child: PageData(
                                      textEditingController: value
                                          .mobileNumberRequesterTextController,
                                      width: width,
                                      height: height,
                                      textSpan: 'رقم الجوال',
                                      labelText: ' إدخل رقم الجوال',
                                      isMandatory: false,
                                    ),
                                  ),
                                ),
                                // الجنس
                                SelectGanderWidget(
                                  key: value.ganderRequesterKey,
                                  height: height,
                                  width: width,
                                  selectMaleOnTap: () {
                                    value.selectMale();
                                  },
                                  selectFemaleOnTap: () {
                                    value.selectFemale();
                                  },
                                  male: value.male,
                                  female: value.female,
                                ),
                                //  الجنسية
                                SizedBox(
                                  key: value.nationalityRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Column(
                                    children: [
                                      const Spacer(
                                        flex: 2,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 30.sp),
                                            children: [
                                              TextSpan(
                                                text: "الجنسية",
                                                style: TextStyle(
                                                    fontSize:
                                                        setFont(context, 35),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              WidgetSpan(
                                                child: Transform.translate(
                                                  offset:
                                                      const Offset(0.0, 3.0),
                                                  child: Text(
                                                    '(إختياري)',
                                                    style: TextStyle(
                                                        fontSize: setFont(
                                                            context, 12.5),
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          width: width / 2,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                124, 158, 158, 158),
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: DropdownButton<String>(
                                              hint: MyText(
                                                fieldName: 'اختر الجنسية',
                                                fontSize: setFont(context, 20),
                                              ),
                                              value: value
                                                  .selectedNationalityRequester,
                                              onChanged: (newValue) {
                                                // setState(() {
                                                //   value.selectedNationalityRequester =
                                                //       newValue;
                                                // });
                                              },
                                              items: value.arabNationalitiesList
                                                  .map(
                                                (nationality) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: nationality,
                                                    child: MyText(
                                                      fieldName: nationality,
                                                      fontSize:
                                                          setFont(context, 15),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 4,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  key: value.weightRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Center(
                                    child: PageData(
                                      textEditingController:
                                          value.weightRequesterTextController,
                                      width: width,
                                      height: height,
                                      labelText: 'الوزن',
                                      textSpan: 'ادخل الوزن',
                                      isMandatory: false,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  key: value.ageRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Center(
                                    child: PageData(
                                      textEditingController:
                                          value.ageRequesterTextController,
                                      width: width,
                                      height: height,
                                      labelText: 'العمر',
                                      textSpan: 'ادخل العمر',
                                      isMandatory: false,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  key: value.skinColorRequesterKey,
                                  width: width,
                                  height: height,
                                  child: SelectSckinColorWidget(),
                                ),
                                SizedBox(
                                  key: value.employmentStatusRequesterKey,
                                  width: width,
                                  height: height,
                                  child: const EmploymentStatusWidget(),
                                ),
                                SizedBox(
                                  key: value.commitmentDegreeRequesterKey,
                                  width: width,
                                  height: height,
                                  child: const CommitmentDegreeRequester(),
                                ),
                                SizedBox(
                                  key: value.tribeRequesterKey,
                                  width: width,
                                  height: height,
                                  child: const TribeTypeRequester(),
                                ),
                                SizedBox(
                                  key: value.tribeNameRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Center(
                                    child: PageData(
                                      textEditingController: value
                                          .tribeNameRequesterTextController,
                                      width: width,
                                      height: height,
                                      labelText: 'اسم القبيله',
                                      textSpan: 'اسم القبيله',
                                      isMandatory: false,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  key: value.isSmokerRequesterKey,
                                  width: width,
                                  height: height,
                                  child: const IsSmokgerWidget(),
                                ),
                                SizedBox(
                                  key: value.maritalStatusRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30.sp),
                                          children: [
                                            TextSpan(
                                              text: "الحالة الاجتماعيه",
                                              style: TextStyle(
                                                  fontSize:
                                                      setFont(context, 25),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(0.0, 3.0),
                                                child: Text(
                                                  '(إختياري)',
                                                  style: TextStyle(
                                                      fontSize: setFont(
                                                          context, 12.5),
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              124, 158, 158, 158),
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: DropdownButton<String>(
                                          hint: MyText(
                                            fieldName: 'اختر الحالة',
                                            fontSize: setFont(context, 20),
                                          ),
                                          value: value
                                              .selectedMaritalStatusRequester,
                                          onChanged: (newValue) {
                                            // setState(() {
                                            //   value.selectedMaritalStatusRequester =
                                            //       newValue;
                                            // });
                                          },
                                          items: value
                                              .maritalStatusRequesterList
                                              .map(
                                            (maritalStatus) {
                                              return DropdownMenuItem<String>(
                                                value: maritalStatus,
                                                child: Center(
                                                  child: MyText(
                                                    fieldName: maritalStatus,
                                                    fontSize:
                                                        setFont(context, 16),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  key: value.educationalLevelRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30.sp),
                                          children: [
                                            TextSpan(
                                              text: "المستوي التعليمي",
                                              style: TextStyle(
                                                  fontSize:
                                                      setFont(context, 25),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(0.0, 3.0),
                                                child: Text(
                                                  '(إختياري)',
                                                  style: TextStyle(
                                                      fontSize: setFont(
                                                          context, 12.5),
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              124, 158, 158, 158),
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: DropdownButton<String>(
                                          hint: MyText(
                                            fieldName: 'اختر المستوي',
                                            fontSize: setFont(context, 20),
                                          ),
                                          value: value
                                              .selectedEducationalLevelRequester,
                                          onChanged: (newValue) {
                                            // setState(() {
                                            //   value.selectedEducationalLevelRequester =
                                            //       newValue;
                                            // });
                                          },
                                          items: value.educationalLevelList.map(
                                            (educationalLevel) {
                                              return DropdownMenuItem<String>(
                                                value: educationalLevel,
                                                child: Center(
                                                    child: MyText(
                                                  fieldName: educationalLevel,
                                                  fontSize:
                                                      setFont(context, 16),
                                                )),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  key: value.mariageTypeRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30.sp),
                                          children: [
                                            TextSpan(
                                              text: "نوع الزواج",
                                              style: TextStyle(
                                                  fontSize:
                                                      setFont(context, 25),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(0.0, 3.0),
                                                child: Text(
                                                  '(إختياري)',
                                                  style: TextStyle(
                                                      fontSize: setFont(
                                                          context, 12.5),
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // mariageTypeRequesterKey
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              124, 158, 158, 158),
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: DropdownButton<String>(
                                          hint: MyText(
                                            fieldName: 'اختر النوع',
                                            fontSize: setFont(context, 20),
                                          ),
                                          value: value
                                              .selectedmariageTypelRequester,
                                          onChanged: (newValue) {
                                            // setState(() {
                                            //   value.selectedmariageTypelRequester =
                                            //       newValue;
                                            // });
                                          },
                                          items: value.mariageTypeList.map(
                                            (mariageType) {
                                              return DropdownMenuItem<String>(
                                                value: mariageType,
                                                child: Center(
                                                  child: MyText(
                                                    fieldName: mariageType,
                                                    fontSize:
                                                        setFont(context, 16),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  key: value.residenceAreaRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Center(
                                    child: PageData(
                                      textEditingController: value
                                          .residenceAreaRequesterKeyController,
                                      width: width,
                                      height: height,
                                      labelText: 'ادخل منطقة الأقامه',
                                      textSpan: 'منطقة الاقامه',
                                      isMandatory: false,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  key: value.originRegionRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Center(
                                    child: PageData(
                                      textEditingController:
                                          value.originRegionRequesterController,
                                      width: width,
                                      height: height,
                                      labelText: 'ادخل منطقة ألاصل',
                                      textSpan: 'منطقة ألاصل',
                                      isMandatory: false,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  key: value
                                      .acceptAnotherNationalityRequesterKey,
                                  width: width,
                                  height: height,
                                  child: AcceptNationalityWidget(),
                                ),
                                SizedBox(
                                  key: value.talkAboutYourSelfRequesterKey,
                                  width: width,
                                  height: height,
                                  child: Center(
                                    child: SizedBox(
                                      width: width / 2,
                                      height: height / 1.6,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30.sp),
                                              children: [
                                                TextSpan(
                                                  text: 'تحدث عن نفسك',
                                                  style: TextStyle(
                                                      fontSize:
                                                          setFont(context, 35),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                WidgetSpan(
                                                  child: Transform.translate(
                                                    offset:
                                                        const Offset(0.0, 3.0),
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                          fontSize: setFont(
                                                              context, 12.5),
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 15,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              textDirection: TextDirection.rtl,

                                              controller: value
                                                  .talkAboutYourSelfTextController,
                                              decoration: InputDecoration(
                                                border:
                                                    const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 2),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 4, 54, 95),
                                                      width: 3),
                                                ),
                                                hintText:
                                                    'مفاتيح الوصف (الجوانب الأنسانية , سبب الزواج ...........)',
                                                hintStyle: TextStyle(
                                                  fontSize:
                                                      setFont(context, 10),
                                                  color: const Color.fromARGB(
                                                      179, 0, 0, 0),
                                                ),
                                              ),
                                              style: TextStyle(
                                                fontSize: setFont(context, 20),
                                              ),
                                              maxLines:
                                                  5, // لجعل الحقل يستوعب نصوص متعددة الأسطر
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // الشروط المطلوبه في الطرف الاخر س
                                SizedBox(
                                  key: value.ageRequestedKey,
                                  width: width,
                                  height: height,
                                  child: Expanded(
                                    child: Column(
                                      children: [
                                        const Spacer(
                                          flex: 1,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: MyText(
                                            color: Colors.red,
                                            fieldName:
                                                'الشروط المطلوبه في الطرف الاخر',
                                            fontWeight: FontWeight.bold,
                                            fontSize: setFont(context, 25),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: MyText(
                                            color: Colors.black,
                                            fieldName: 'العمر',
                                            fontWeight: FontWeight.bold,
                                            fontSize: setFont(context, 35),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Row(
                                            children: [
                                              const Spacer(),
                                              Expanded(
                                                flex: 3,
                                                child: PageData(
                                                  textEditingController: value
                                                      .ageRequestedFromTextController,
                                                  width: width,
                                                  height: height,
                                                  labelText: 'من',
                                                  textSpan: '',
                                                  isMandatory: true,
                                                ),
                                              ),
                                              const Spacer(),
                                              Expanded(
                                                flex: 3,
                                                child: PageData(
                                                  textEditingController: value
                                                      .ageRequestedToTextController,
                                                  width: width,
                                                  height: height,
                                                  labelText: 'الي',
                                                  textSpan: '',
                                                  isMandatory: true,
                                                ),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  key: value.maritalStatusRequestedKey,
                                  width: width,
                                  height: height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: setFont(context, 35),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "الحالة الاجتماعية",
                                              style: TextStyle(
                                                  fontSize:
                                                      setFont(context, 35),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(0.0, 3.0),
                                                child: Text(
                                                  '',
                                                  style: TextStyle(
                                                      fontSize: setFont(
                                                          context, 12.5),
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // mariageTypeRequesterKey
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              124, 158, 158, 158),
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: DropdownButton<String>(
                                          hint: MyText(
                                            fieldName: 'اختر الحالة',
                                            fontSize: setFont(context, 20),
                                          ),
                                          value: value
                                              .selectedMaritalStatusRequested,
                                          onChanged: (newValue) {
                                            // setState(() {
                                            //   value.selectedMaritalStatusRequested =
                                            //       newValue;
                                            // });
                                          },
                                          items: value
                                              .maritalStatusRequestedList
                                              .map(
                                            (maritalStatusRequested) {
                                              return DropdownMenuItem<String>(
                                                value: maritalStatusRequested,
                                                child: Center(
                                                    child: Text(
                                                        maritalStatusRequested)),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  key: value.residenceAreaRequestedKey,
                                  width: width,
                                  height: height,
                                  child: Center(
                                    child: PageData(
                                      textEditingController: value
                                          .residenceAreaRequestedController,
                                      width: width,
                                      height: height,
                                      labelText: 'منطقة الاقامة',
                                      textSpan: 'منطقة الاقامة',
                                      isMandatory: false,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  key: value.educationalLevelRequestedKey,
                                  width: width,
                                  height: height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: setFont(context, 35),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "المستوي التعليمي",
                                              style: TextStyle(
                                                  fontSize:
                                                      setFont(context, 35),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(0.0, 3.0),
                                                child: Text(
                                                  '(إختياري)',
                                                  style: TextStyle(
                                                      fontSize: setFont(
                                                          context, 12.5),
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              124, 158, 158, 158),
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: DropdownButton<String>(
                                          hint: MyText(
                                            fieldName: 'اختر المستوي',
                                            fontSize: setFont(context, 20),
                                          ),
                                          value: value
                                              .selectedEducationalLevelRequested,
                                          onChanged: (newValue) {
                                            // setState(() {
                                            //   value.selectedEducationalLevelRequested =
                                            //       newValue;
                                            // });
                                          },
                                          items: value.educationalLevelList.map(
                                            (educationalLevelRequested) {
                                              return DropdownMenuItem<String>(
                                                value:
                                                    educationalLevelRequested,
                                                child: Center(
                                                    child: Text(
                                                        educationalLevelRequested)),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  key: value.weightRequestedKey,
                                  width: width,
                                  height: height,
                                  child: WeightRequestedWidget(),
                                ),
                                SizedBox(
                                  key: value.skinColorRequestedKey,
                                  width: width,
                                  height: height,
                                  child: SkinColorRequestedKeyWidget(),
                                ),
                                EndWidget(
                                  key: value.emailKey,
                                  width: width,
                                  height: height,
                                  onTap: () {
                                    value.sendOrder(context);
                                  },
                                  labelText: 'الإيميل',
                                  textEditingController:
                                      value.emailTextController,
                                  isLoading: value.isLoading,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Positioned(
                        bottom: 20,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 40.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  value.scrollToNext();
                                },
                                child: Container(
                                  width: 85.r,
                                  height: 85.r,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: MyText(
                                    fieldName: "التالي",
                                    fontSize: setFont(context, 17),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  value.scrollToPrevious();
                                },
                                child: Container(
                                  width: 85.r,
                                  height: 85.r,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: MyText(
                                      fieldName: "السابق",
                                      fontSize: setFont(context, 17),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SelectGanderWidget extends StatelessWidget {
  SelectGanderWidget({
    super.key,
    required this.width,
    required this.height,
    required this.selectMaleOnTap,
    required this.selectFemaleOnTap,
    required this.male,
    required this.female,
  });
  void Function()? selectMaleOnTap;
  void Function()? selectFemaleOnTap;

  final double width;
  final double height;
  final bool male;
  final bool female;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 1,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: setFont(context, 35),
                ),
                children: [
                  WidgetSpan(
                    child: Transform.translate(
                      offset: const Offset(0.0, 3.0),
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 5.sp, color: Colors.black),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: "إختر جنسك",
                    style: TextStyle(
                        fontSize: setFont(context, 35),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                Expanded(
                  flex: Res.isMobile(context) ? 2 : 1,
                  child: GestureDetector(
                    onTap: selectMaleOnTap,
                    child: Container(
                      width: width / 2,
                      height: height / 3,
                      decoration: male
                          ? BoxDecoration(
                              color: Colors.amber,
                              border: Border.all(
                                  color: const Color.fromARGB(255, 95, 3, 3)),
                              borderRadius: BorderRadius.circular(10),
                            )
                          : BoxDecoration(
                              color: const Color.fromARGB(124, 158, 158, 158),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/man_two.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: Res.isMobile(context) ? 2 : 1,
                  child: GestureDetector(
                    onTap: selectFemaleOnTap,
                    child: Container(
                      width: width / 3,
                      height: height / 3,
                      decoration: female
                          ? BoxDecoration(
                              color: Colors.amber,
                              border: Border.all(
                                  color: const Color.fromARGB(255, 95, 3, 3)),
                              borderRadius: BorderRadius.circular(10),
                            )
                          : BoxDecoration(
                              color: const Color.fromARGB(124, 158, 158, 158),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/women.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class PageData extends StatelessWidget {
  PageData({
    super.key,
    required this.textEditingController,
    required this.width,
    required this.height,
    required this.labelText,
    required this.textSpan,
    required this.isMandatory,
  });

  final TextEditingController textEditingController;
  final double width;
  final double height;
  final String labelText;
  final String textSpan;
  final bool isMandatory;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: setWidth(context, width),
      height: height / 1.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: setFont(context, 35),
              ),
              children: [
                TextSpan(
                  text: textSpan,
                  style: TextStyle(
                      fontSize: setFont(context, 35),
                      fontWeight: FontWeight.bold),
                ),
                WidgetSpan(
                  child: Transform.translate(
                    offset: const Offset(0.0, 3.0),
                    child: Text(
                      isMandatory ? " " : '(إختياري)',
                      style: TextStyle(
                          fontSize: setFont(context, 12.5),
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height / 15,
          ),
          SizedBox(
            height: height / 2.5,
            width: width / 1.5,
            child: TextField(
              textDirection: TextDirection.rtl,
              controller: textEditingController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 4, 54, 95), width: 3),
                ),
                labelText: labelText,
                labelStyle: TextStyle(
                    fontSize: setFont(context, 22),
                    color: const Color.fromARGB(255, 2, 34, 60)),
                hintStyle: TextStyle(
                    fontSize: setFont(context, 22),
                    color: const Color.fromARGB(179, 0, 0, 0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    this.fieldName,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textDirection,
    this.textAlign,
  });

  final double? fontSize;
  final String? fieldName;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: textAlign,
        textDirection: textDirection,
        fieldName!,
        style:
            TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      ),
    );
  }
}

  // ColorsWidget(
                          //   key: value.skinColorRequesterKey,
                          // ),