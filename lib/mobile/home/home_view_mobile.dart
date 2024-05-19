import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widget.dart';

class HomeViewMobile extends StatefulWidget {
  final Function()? onTap;

  HomeViewMobile({
    super.key,
    required this.onTap,
  });

  @override
  _HomeViewMobileState createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color.fromARGB(255, 83, 169, 238),
                Color.fromARGB(255, 66, 135, 245)
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () {
                          // Scrollable.ensureVisible(
                          // sendUskey.currentContext!,
                          // duration: const Duration(seconds: 1),
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                            child: MyTextMobile(
                              fontSize: 15.r,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fieldName: 'تواصل معنا',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.envelope,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Image.asset(
                    //       color: Color.fromARGB(255, 233, 177, 100),
                    //       'assets/images/logo.png',
                    //       height: 60.r,
                    //       width: 60.r,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: MyTextMobile(
                  fieldName: 'اهلا بك , في منصة ازواچ',
                  fontSize: 50.r,
                  color: const Color.fromARGB(255, 5, 27, 45),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                flex: 1,
                child: MyTextMobile(
                  fieldName: 'اعثر علي شريك حياة به كل المواصفات التي تريدها',
                  fontSize: 25.r,
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/1st_page.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
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
    return SizedBox(
      width: 600,
      height: 50,
      child: TextField(
        textDirection: TextDirection.rtl,
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }
}
