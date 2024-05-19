import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../desktop/add_order/order_desk_view.dart';
import '../../desktop/home/home_prov.dart';
import '../add_order/order_mobile_view.dart';
import '../home/home_view_mobile.dart';
import '../home/widget.dart';
import '../selecet_gander/select_gander_mobile.dart';

class MainViewMobile extends StatefulWidget {
  const MainViewMobile({Key? key}) : super(key: key);

  @override
  State<MainViewMobile> createState() => _MainViewMobileState();
}

class _MainViewMobileState extends State<MainViewMobile> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  bool isMobile = false;

  Future<void> getDeviceType(double width) async {
    if (width < 800) {
      isMobile = true;
    }
  }

  final homeKey = GlobalKey();
  final addOrderkey = GlobalKey();
  final sendUskey = GlobalKey();
  final whoUsKey = GlobalKey();
  final footerkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    getDeviceType(width);
    return Scaffold(
      key: drawerKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Consumer<HomeProvDesktop>(
                builder: (BuildContext context, HomeProvDesktop value,
                    Widget? child) {
                  return SizedBox(
                    height: 2200,
                    width: width,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.black,
                            child: Center(
                              child: MyTextMobile(
                                textAlign: TextAlign.center,
                                fieldName:
                                    "يَا أَيُّهَا النَّاسُ إِنَّا خَلَقْنَاكُم مِّن ذَكَرٍ وَأُنثَىٰ وَجَعَلْنَاكُمْ شُعُوبًا وَقَبَائِلَ لِتَعَارَفُوا ۚ",
                                fontSize: 17.r,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          key: homeKey,
                          child: Container(
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(183, 255, 255, 255),
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: HomeViewMobile(
                              key: homeKey,
                              onTap: () {
                                Scrollable.ensureVisible(
                                  addOrderkey.currentContext!,
                                  duration: const Duration(seconds: 2),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            child: SelectGanderMobile(
                              maleOnTap: () {
                                value.selectMale();
                              },
                              femaleOnTap: () {
                                value.selectFemale();
                              },
                              male: value.male,
                              female: value.female,
                            ),
                          ),
                        ),
                        isMobile
                            ? Expanded(
                                flex: 16,
                                child: Consumer<HomeProvDesktop>(
                                  builder: (context, value, child) {
                                    return Stack(
                                      children: [
                                        SizedBox(
                                          key: addOrderkey,
                                          width: width,
                                          child: OrderViewMobile(
                                            key: homeKey,
                                          ),
                                        ),
                                        value.isLoading
                                            ? Container(
                                                color: const Color.fromARGB(
                                                    213, 255, 255, 255),
                                                width: width,
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      const Spacer(flex: 5),
                                                      const CircularProgressIndicator(
                                                        color: Colors.green,
                                                      ),
                                                      const Spacer(flex: 1),
                                                      MyTextMobile(
                                                        fieldName:
                                                            'جاري رفع الطلب',
                                                        fontSize: 30.r,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                              )
                            : Expanded(flex: 16, child: OrderViewDesk())
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
