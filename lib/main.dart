import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'app/provider/home_prov.dart';
import 'constants/firebase_options.dart';
import 'app/main_view.dart';
import 'constants/responsive.dart';

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
    const MyApp(),
  );
}

double setWidth(context, double value) {
  double width;
  if (Res.isMobile(context)) {
    width = value;
    return width;
  } else {
    width = (value / 2);
    return width;
  }
}

double setFont(context, double value) {
  double font;
  if (Res.isMobile(context)) {
    font = (value * 1.3);
    return font;
  } else {
    font = (value * 1);
    return font;
  }
}

Future<void> getDeviceType(double width) async {
  if (width < 800) {
    isMobile = true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    ScreenUtil.init(context);
    getDeviceType(width);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeProvider()),
        ],
        child: const MaterialApp(
            title: 'أزواج',
            debugShowCheckedModeBanner: false,
            home: Expanded(child: MainPage())),
      ),
    );
  }
}
