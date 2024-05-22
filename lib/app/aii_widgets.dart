import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants/responsive.dart';
import '../main.dart';
import 'main_view/widgets/contact_widget.dart';
import 'main_view/widgets/loading.dart';
import 'provider/home_prov.dart';
import 'main_view.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
  });
  void Function()? onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Expanded(flex: 1, child: ContactsWidgets()),
          const Spacer(
            flex: 3,
          ),
          Expanded(
            flex: 3,
            child: MyText(
              color: Colors.red,
              fieldName: 'الرئيسيه',
              fontWeight: FontWeight.bold,
              fontSize: setFont(context, 35),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: Res.isMobile(context) ? width / 1.5 : width / 2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: MyText(
                    fieldName: "ابدأ",
                    fontSize: setFont(context, 25),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}

class SelectSckinColorWidget extends StatelessWidget {
  SelectSckinColorWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: setFont(context, 35),
                      ),
                      children: [
                        TextSpan(
                          text: "أختر لون البشره",
                          style: TextStyle(
                              fontSize: setFont(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, 3.0),
                            child: Text(
                              '(إختياري)',
                              style: TextStyle(
                                  fontSize: setFont(context, 12.5),
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 6,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Res.isMobile(context)
                                ? 3
                                : 6, // عدد الأعمدة في الشبكة
                            crossAxisSpacing: Res.isMobile(context)
                                ? 5
                                : 5, // المسافه بين الحقول
                            mainAxisSpacing: Res.isMobile(context)
                                ? 30
                                : 5, //   المسافه بين الصفوف
                            childAspectRatio: Res.isMobile(context) ? 30 : 5,
                            mainAxisExtent: Res.isMobile(context) ? 50 : 30,
                          ),
                          itemCount: value.skinColorsList.length,
                          itemBuilder: (context, index) {
                            var color = value.skinColorsList[index];
                            return GestureDetector(
                              onTap: () {
                                value.selectColor(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      value.selectedRequesterSkinColor == index
                                          ? Colors.blue.withOpacity(0.3)
                                          : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: value.selectedRequesterSkinColor ==
                                            index
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    value.skinColorsList[index],
                                    style: TextStyle(
                                      fontSize: setFont(context, 13),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EmploymentStatusWidget extends StatelessWidget {
  const EmploymentStatusWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      children: [
                        TextSpan(
                          text: " الحالة الوظيفية",
                          style: TextStyle(
                              fontSize: setFont(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, 3.0),
                            child: Text(
                              '(إختياري)',
                              style: TextStyle(
                                  fontSize: setFont(context, 12.5),
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
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 6,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Res.isMobile(context)
                                ? 3
                                : 5, // عدد الأعمدة في الشبكة
                            crossAxisSpacing: Res.isMobile(context)
                                ? 5
                                : 5, // المسافه بين الحقول
                            mainAxisSpacing: Res.isMobile(context)
                                ? 30
                                : 5, //   المسافه بين الصفوف
                            childAspectRatio: Res.isMobile(context) ? 30 : 5,
                            mainAxisExtent: Res.isMobile(context) ? 50 : 30,
                          ),
                          itemCount: value.employmentStatusList.length,
                          itemBuilder: (context, index) {
                            var jobStatus = value.employmentStatusList[index];
                            return GestureDetector(
                              onTap: () {
                                value.selectEmploymentStatus(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: value.selectedEmploymentStatus == index
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        value.selectedEmploymentStatus == index
                                            ? Colors.blue
                                            : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: MyText(
                                    fieldName: jobStatus,
                                    fontSize: setFont(context, 13),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CommitmentDegreeRequester extends StatelessWidget {
  const CommitmentDegreeRequester({super.key});
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      children: [
                        TextSpan(
                          text: "درجة الألتزام",
                          style: TextStyle(
                              fontSize: setFont(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, 3.0),
                            child: Text(
                              '(إختياري)',
                              style: TextStyle(
                                  fontSize: setFont(context, 12.5),
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 6,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Res.isMobile(context)
                                ? 3
                                : 5, // عدد الأعمدة في الشبكة
                            crossAxisSpacing: Res.isMobile(context)
                                ? 5
                                : 5, // المسافه بين الحقول
                            mainAxisSpacing: Res.isMobile(context)
                                ? 30
                                : 5, //   المسافه بين الصفوف
                            childAspectRatio: Res.isMobile(context) ? 30 : 5,
                            mainAxisExtent: Res.isMobile(context) ? 50 : 30,
                          ),
                          itemCount: value.commitmentDegreeRequesterList.length,
                          itemBuilder: (context, index) {
                            var commitmentDegree =
                                value.commitmentDegreeRequesterList[index];
                            return GestureDetector(
                              onTap: () {
                                value.selecteCommitmentDegreeRequester(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      value.selectedCommitmentDegreeRequester ==
                                              index
                                          ? Colors.blue.withOpacity(0.3)
                                          : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        value.selectedCommitmentDegreeRequester ==
                                                index
                                            ? Colors.blue
                                            : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: MyText(
                                    fieldName: commitmentDegree,
                                    fontSize: setFont(context, 13),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TribeTypeRequester extends StatelessWidget {
  const TribeTypeRequester({super.key});
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      children: [
                        TextSpan(
                          text: "القبيلة",
                          style: TextStyle(
                              fontSize: setFont(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, 3.0),
                            child: Text(
                              '(إختياري)',
                              style: TextStyle(
                                  fontSize: setFont(context, 12.5),
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: Res.isMobile(context) ? 9 : 1,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Res.isMobile(context)
                                ? 3
                                : 3, // عدد الأعمدة في الشبكة
                            crossAxisSpacing: Res.isMobile(context)
                                ? 5
                                : 5, // المسافه بين الحقول
                            mainAxisSpacing: Res.isMobile(context)
                                ? 30
                                : 5, //   المسافه بين الصفوف
                            childAspectRatio: Res.isMobile(context) ? 30 : 5,
                            mainAxisExtent: Res.isMobile(context) ? 50 : 30,
                          ),
                          itemCount: value.tribeList.length,
                          itemBuilder: (context, index) {
                            var tribe = value.tribeList[index];
                            return GestureDetector(
                              onTap: () {
                                value.selectTribe(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: value.selectedTribe == index
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: value.selectedTribe == index
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: MyText(
                                    fieldName: tribe,
                                    fontSize: setFont(context, 13),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class IsSmokgerWidget extends StatelessWidget {
  const IsSmokgerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      children: [
                        TextSpan(
                          text: "مدخن",
                          style: TextStyle(
                              fontSize: setFont(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, 3.0),
                            child: Text(
                              '(إختياري)',
                              style: TextStyle(
                                  fontSize: setFont(context, 12.5),
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 6,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Res.isMobile(context)
                                ? 2
                                : 2, // عدد الأعمدة في الشبكة
                            crossAxisSpacing: Res.isMobile(context)
                                ? 5
                                : 5, // المسافه بين الحقول
                            mainAxisSpacing: Res.isMobile(context)
                                ? 30
                                : 5, //   المسافه بين الصفوف
                            childAspectRatio: Res.isMobile(context) ? 30 : 5,
                            mainAxisExtent: Res.isMobile(context) ? 50 : 30,
                          ),
                          itemCount: value.isSmokerList.length,
                          itemBuilder: (context, index) {
                            var tribe = value.isSmokerList[index];
                            return GestureDetector(
                              onTap: () {
                                value.selectIsSmker(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: value.selectedIsSmoker == index
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: value.selectedIsSmoker == index
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: MyText(
                                    fieldName: tribe,
                                    fontSize: setFont(context, 13),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AcceptNationalityWidget extends StatelessWidget {
  AcceptNationalityWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      children: [
                        TextSpan(
                          text: "هل تقبل بجنسة أخري",
                          style: TextStyle(
                              fontSize: setFont(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, 3.0),
                            child: Text(
                              '(إختياري)',
                              style: TextStyle(
                                  fontSize: setFont(context, 12.5),
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
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 6,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Res.isMobile(context)
                                ? 2
                                : 2, // عدد الأعمدة في الشبكة
                            crossAxisSpacing: Res.isMobile(context)
                                ? 5
                                : 5, // المسافه بين الحقول
                            mainAxisSpacing: Res.isMobile(context)
                                ? 30
                                : 5, //   المسافه بين الصفوف
                            childAspectRatio: Res.isMobile(context) ? 30 : 5,
                            mainAxisExtent: Res.isMobile(context) ? 50 : 30,
                          ),
                          itemCount: value.acceptOtherNathonalityList.length,
                          itemBuilder: (context, index) {
                            var acceptOrNo =
                                value.acceptOtherNathonalityList[index];
                            return GestureDetector(
                              onTap: () {
                                value.selectAcceptNationality(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: value.selectedAcceptOtherNationality ==
                                          index
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        value.selectedAcceptOtherNationality ==
                                                index
                                            ? Colors.blue
                                            : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    acceptOrNo,
                                    style: TextStyle(
                                      fontSize: setFont(context, 13),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MaritalStatusRequestedWidgey extends StatelessWidget {
  MaritalStatusRequestedWidgey({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      children: [
                        TextSpan(
                          text: "الحالة الاجتماعيه",
                          style: TextStyle(
                              fontSize: setFont(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, 3.0),
                            child: Text(
                              '',
                              style: TextStyle(
                                  fontSize: setFont(context, 5),
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 6,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Res.isMobile(context)
                                ? 2
                                : 2, // عدد الأعمدة في الشبكة
                            crossAxisSpacing: Res.isMobile(context)
                                ? 5
                                : 5, // المسافه بين الحقول
                            mainAxisSpacing: Res.isMobile(context)
                                ? 30
                                : 5, //   المسافه بين الصفوف
                            childAspectRatio: Res.isMobile(context) ? 30 : 5,
                            mainAxisExtent: Res.isMobile(context) ? 50 : 30,
                          ),
                          itemCount: value.maritalStatusRequestedList.length,
                          itemBuilder: (context, index) {
                            var maritalStatusRequested =
                                value.maritalStatusRequestedList[index];
                            return GestureDetector(
                              onTap: () {
                                value.selectMaritalStatusRequested(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: value.selectedMaritalStatusRequested ==
                                          index
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        value.selectedMaritalStatusRequested ==
                                                index
                                            ? Colors.blue
                                            : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    maritalStatusRequested,
                                    style: TextStyle(
                                      fontSize: setFont(context, 13),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class WeightRequestedWidget extends StatelessWidget {
  WeightRequestedWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      children: [
                        TextSpan(
                          text: "الوزن",
                          style: TextStyle(
                              fontSize: setFont(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, 3.0),
                            child: Text(
                              '(إختياري)',
                              style: TextStyle(
                                  fontSize: setFont(context, 12.5),
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 6,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Res.isMobile(context)
                                ? 2
                                : 2, // عدد الأعمدة في الشبكة
                            crossAxisSpacing: Res.isMobile(context)
                                ? 5
                                : 5, // المسافه بين الحقول
                            mainAxisSpacing: Res.isMobile(context)
                                ? 30
                                : 5, //   المسافه بين الصفوف
                            childAspectRatio: Res.isMobile(context) ? 30 : 5,
                            mainAxisExtent: Res.isMobile(context) ? 50 : 30,
                          ),
                          itemCount: value.weightRequestedList.length,
                          itemBuilder: (context, index) {
                            var weightRequested =
                                value.weightRequestedList[index];
                            return GestureDetector(
                              onTap: () {
                                value.selectweightRequested(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: value.selectedWeightRequested == index
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        value.selectedWeightRequested == index
                                            ? Colors.blue
                                            : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    weightRequested,
                                    style: TextStyle(
                                      fontSize: setFont(context, 13),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SkinColorRequestedKeyWidget extends StatelessWidget {
  SkinColorRequestedKeyWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      children: [
                        TextSpan(
                          text: " لون بشرة الشريك",
                          style: TextStyle(
                              fontSize: setFont(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, 3.0),
                            child: Text(
                              '(إختياري)',
                              style: TextStyle(
                                  fontSize: setFont(context, 12.5),
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 6,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Res.isMobile(context)
                                ? 3
                                : 4, // عدد الأعمدة في الشبكة
                            crossAxisSpacing: Res.isMobile(context)
                                ? 5
                                : 5, // المسافه بين الحقول
                            mainAxisSpacing: Res.isMobile(context)
                                ? 30
                                : 5, //   المسافه بين الصفوف
                            childAspectRatio: Res.isMobile(context) ? 30 : 5,
                            mainAxisExtent: Res.isMobile(context) ? 50 : 30,
                          ),
                          itemCount: value.skinColorsList.length,
                          itemBuilder: (context, index) {
                            var color = value.skinColorsList[index];
                            return GestureDetector(
                              onTap: () {
                                value.selectSkinColorRequest(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      value.selectedRequestedSkinColor == index
                                          ? Colors.blue.withOpacity(0.3)
                                          : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: value.selectedRequestedSkinColor ==
                                            index
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    value.skinColorsList[index],
                                    style: TextStyle(
                                      fontSize: setFont(context, 13),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EndWidget extends StatelessWidget {
  EndWidget({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.labelText,
    required this.textEditingController,
    required this.isLoading,
  });
  void Function()? onTap;
  final double width;
  final double height;
  final String labelText;
  final TextEditingController textEditingController;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 1,
                child: MyText(
                  color: Colors.red,
                  fieldName: 'إنهاء التسجيل',
                  fontWeight: FontWeight.bold,
                  fontSize: setFont(context, 20),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: Res.isMobile(context) ? width / 1.5 : width / 2.5,
                  height: Res.isMobile(context) ? height / 1.5 : height / 2.5,
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
                          fontSize: 22.r,
                          color: const Color.fromARGB(255, 2, 34, 60)),
                      hintStyle: TextStyle(
                          fontSize: 22.r,
                          color: const Color.fromARGB(179, 0, 0, 0)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: MyText(
                        fieldName: "حفظ",
                        fontSize: setFont(context, 15),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          isLoading
              ? Loading(
                  width: width,
                  height: height,
                )
              : SizedBox(),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
