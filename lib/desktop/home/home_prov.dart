import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeProvDesktop extends ChangeNotifier {
  PageController _pageController = PageController();
  int _currentPage = 0;
  String deviceType = 'Unknown';
  bool isLoading = false;
  bool male = false;
  bool female = false;

  PageController get pageController => _pageController;
  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  void showLoading() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  TextEditingController nameTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  TextEditingController heightTextController = TextEditingController();
  TextEditingController weightTextController = TextEditingController();
  TextEditingController skinColorTextController = TextEditingController();
  TextEditingController qualificationTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController nationalityTextController = TextEditingController();
  TextEditingController jobTextController = TextEditingController();
  TextEditingController financialStateTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  TextEditingController requestedAgeTextController = TextEditingController();

  TextEditingController requestedHeightTextController = TextEditingController();
  TextEditingController requestedWeightTextController = TextEditingController();
  TextEditingController requestedSkinColorTextController =
      TextEditingController();
  TextEditingController requestedQualificationTextController =
      TextEditingController();
  TextEditingController requestedCityTextController = TextEditingController();
  TextEditingController requestedNationalityTextController =
      TextEditingController();
  TextEditingController requestedJobTextController = TextEditingController();
  TextEditingController requestedFinancialStateTextController =
      TextEditingController();

  Future<void> sendOrder(context) async {
    showLoading();
    try {
      // قم بتحديث Firestore ببيانات الطلب
      await FirebaseFirestore.instance.collection('orders').doc().set({
        "requester_data": {
          'requester_name': nameTextController.text,
          'requester_age': ageTextController.text,
          'requester_height': heightTextController.text,
          'requester_weight': weightTextController.text,
          'requester_skin_color': skinColorTextController.text,
          'requester_qualification': qualificationTextController.text,
          'requester_city': cityTextController.text,
          'requester_nationality': nationalityTextController.text,
          'requester_job': jobTextController.text,
          'requester_financial': financialStateTextController.text,
          'email': emailTextController.text,
        },
        "requested_data": {
          'requested_age': ageTextController.text,
          'requested_height': heightTextController.text,
          'requested_weight': weightTextController.text,
          'requested_skin_color': skinColorTextController.text,
          'requested_qualification': qualificationTextController.text,
          'requested_city': cityTextController.text,
          'requested_nationality': nationalityTextController.text,
          'requested_job': jobTextController.text,
          'requested_financial': financialStateTextController.text,
        },
      });
      hideLoading();
      showStatusDialog(context, true);
    } catch (e) {
      hideLoading();
      showStatusDialog(context, false);
    }
  }

  void showStatusDialog(BuildContext context, bool isSuccess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isSuccess ? 'نجاح' : 'فشل  '),
          content: Text(isSuccess ? 'تم ارسال الطلب' : 'فشل ارسال الطلب'),
          actions: [
            TextButton(
              child: const Text('اخفاء'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void selectMale() {
    male = true;
    female = false;
    notifyListeners();
  }

  void selectFemale() {
    female = true;
    male = false;
    notifyListeners();
  }
}
