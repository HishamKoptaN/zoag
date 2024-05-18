import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'desktop/home/home_prov.dart';
import 'desktop/main_view/main_view.dart';
import 'mobile/home/home_prov.dart';
import 'mobile/main_view/main_view_mobile.dart';

bool isMobile = false;
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  runApp(
    MyApp(),
  );
}

Future<void> getDeviceType(double width) async {
  if (width < 800) {
    isMobile = true;
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    getDeviceType(width);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => HomeProvDesktop()),
            ChangeNotifierProvider(create: (_) => HomeProvMbile()),
          ],
          child: MaterialApp(
            title: 'أزواج',
            debugShowCheckedModeBanner: false,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            theme: ThemeData(
                brightness: Brightness.light, primarySwatch: Colors.blue),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: isMobile ? const MainViewMobile() : const MainViewDesk(),
          ),
        ),
      ),
    );
  }
}
