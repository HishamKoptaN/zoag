import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget.dart';

class TopItemWidget extends StatelessWidget {
  const TopItemWidget({
    super.key,
    required this.projectKey,
  });

  final GlobalKey<State<StatefulWidget>> projectKey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 40.h,
        width: 110.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(
                  projectKey.currentContext!,
                  duration: const Duration(seconds: 2),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: const MyText(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fieldName: 'حول',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(
                  projectKey.currentContext!,
                  duration: Duration(seconds: 2),
                );
              },
              child: Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: const MyText(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fieldName: 'تواصل معنا',
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}
