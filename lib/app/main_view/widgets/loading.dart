import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/home_prov.dart';
import 'widgets.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return Stack(
            children: [
              value.isLoading
                  ? Container(
                      color: const Color.fromARGB(213, 255, 255, 255),
                      // width: width,
                      child: Center(
                        child: Column(
                          children: [
                            const Spacer(flex: 5),
                            const CircularProgressIndicator(
                              color: Colors.green,
                            ),
                            const Spacer(flex: 1),
                            MyText(
                              fieldName: 'جاري رفع الطلب',
                              fontSize: 30.r,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            const Spacer(flex: 4),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
