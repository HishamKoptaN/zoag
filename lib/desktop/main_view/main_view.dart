import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../add_order/order_desk_view.dart';
import '../home/home_view.dart';
import '../home/widget.dart';

class MainViewDesk extends StatefulWidget {
  const MainViewDesk({Key? key}) : super(key: key);

  @override
  State<MainViewDesk> createState() => _MainViewDeskState();
}

class _MainViewDeskState extends State<MainViewDesk> {
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const MyText(
          textDirection: TextDirection.rtl,
          fieldName:
              "  يَا أَيُّهَا النَّاسُ إِنَّا خَلَقْنَاكُم مِّن ذَكَرٍ وَأُنثَىٰ وَجَعَلْنَاكُمْ شُعُوبًا وَقَبَائِلَ لِتَعَارَفُوا ۚ إِنَّ أَكْرَمَكُمْ عِندَ اللَّهِ أَتْقَاكُمْ ۚ إِنَّ اللَّهَ عَلِيمٌ خَبِيرٌ  ",
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
      key: drawerKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 40.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.network(
                                color: const Color.fromARGB(255, 4, 38, 65),
                                'assets/logo.png',
                                height: 70,
                                width: 70,
                              ),
                            ),
                            SizedBox(
                              width: 275.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Scrollable.ensureVisible(
                                  sendUskey.currentContext!,
                                  duration: const Duration(seconds: 1),
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
                    ),
                    Container(
                      key: homeKey,
                      height: 625.h,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: const Color.fromARGB(183, 255, 255, 255),
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: HomeViewDesk(
                        key: homeKey,
                        onTap: () {
                          Scrollable.ensureVisible(
                            addOrderkey.currentContext!,
                            duration: const Duration(seconds: 2),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      key: addOrderkey,
                      height: 700,
                      width: width,
                      child: OrderViewDesk(
                        key: homeKey,
                      ),
                    ),
                    Container(
                      height: 70.h,
                      width: width,
                      key: sendUskey,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 90,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.envelope,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.linkedinIn,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.whatsapp,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 140.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Scrollable.ensureVisible(
                                    homeKey.currentContext!,
                                    duration: const Duration(seconds: 1500),
                                  );
                                },
                                child: Container(
                                  height: 50,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
