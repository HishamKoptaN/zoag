import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home/widget.dart';

class SelectGanderMobile extends StatelessWidget {
  final Function()? maleOnTap;
  final Function()? femaleOnTap;
  bool male;
  bool female;
  SelectGanderMobile({
    super.key,
    required this.maleOnTap,
    required this.femaleOnTap,
    required this.male,
    required this.female,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: MyTextMobile(
                            fieldName: 'حدد جنسك',
                            fontSize: 25.r,
                            color: const Color.fromARGB(255, 38, 37, 37),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: femaleOnTap,
                                child: Container(
                                  decoration: female
                                      ? BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.white,
                                              Color.fromARGB(255, 83, 169, 238),
                                              Color.fromARGB(255, 66, 135, 245)
                                            ],
                                          ),
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )
                                      : BoxDecoration(),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(80),
                                    child: Image.asset(
                                      'assets/images/women.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: maleOnTap,
                                child: Container(
                                  decoration: male
                                      ? BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.white,
                                              Color.fromARGB(255, 83, 169, 238),
                                              Color.fromARGB(255, 66, 135, 245)
                                            ],
                                          ),
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )
                                      : const BoxDecoration(),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image.asset(
                                      'assets/images/man.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
