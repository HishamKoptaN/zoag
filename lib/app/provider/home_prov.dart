import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../main_view/widgets/dialogs.dart';

class HomeProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final homeKey = GlobalKey();
  //         مفاتيح الطالب          //////////////////////////////////
  final firstNameRequesterKey = GlobalKey();
  final secondNameRequesterKey = GlobalKey();
  final titleRequesterKey = GlobalKey();
  final mobileNumberRequesterKey = GlobalKey();
  final ganderRequesterKey = GlobalKey();
  final nationalityRequesterKey = GlobalKey();
  final weightRequesterKey = GlobalKey();
  final ageRequesterKey = GlobalKey();
  final skinColorRequesterKey = GlobalKey();
  final employmentStatusRequesterKey = GlobalKey();
  final commitmentDegreeRequesterKey = GlobalKey();
  final tribeRequesterKey = GlobalKey();
  final tribeNameRequesterKey = GlobalKey();
  final isSmokerRequesterKey = GlobalKey();
  final maritalStatusRequesterKey = GlobalKey();
  final educationalLevelRequesterKey = GlobalKey();
  final mariageTypeRequesterKey = GlobalKey();
  final residenceAreaRequesterKey = GlobalKey();
  final originRegionRequesterKey = GlobalKey();
  final acceptAnotherNationalityRequesterKey = GlobalKey();
  final talkAboutYourSelfRequesterKey = GlobalKey();
  //             مفاتيح بالطرف الاخر          //////////////////////////////////
  final ageRequestedKey = GlobalKey();
  final maritalStatusRequestedKey = GlobalKey();
  final residenceAreaRequestedKey = GlobalKey();
  final educationalLevelRequestedKey = GlobalKey();
  final weightRequestedKey = GlobalKey();
  final skinColorRequestedKey = GlobalKey();
  // انهاء التسجيل                         //////////////////////////////////
  final emailKey = GlobalKey();
  final savedKey = GlobalKey();

//////////     تحكم النص                      //////////////////////////////////
  final firstNameRequesterTextController = TextEditingController();
  final secondNameRequesterTextController = TextEditingController();
  final titleRequesterTextController = TextEditingController();
  final mobileNumberRequesterTextController = TextEditingController();
  String? gander;
  String? selectedNationalityRequester;
  final weightRequesterTextController = TextEditingController();
  final ageRequesterTextController = TextEditingController();
  int? selectedRequesterSkinColor;
  int? selectedEmploymentStatus;
  int? selectedCommitmentDegreeRequester;
  int? selectedTribe;
  final tribeNameRequesterTextController = TextEditingController();
  int? selectedIsSmoker;
  String? selectedMaritalStatusRequester;
  String? selectedEducationalLevelRequester;
  final residenceAreaRequesterKeyController = TextEditingController();
  final originRegionRequesterController = TextEditingController();
  String? selectedmariageTypelRequester;
  final talkAboutYourSelfTextController = TextEditingController();
  //            الشروط المطلوبه في الطرف الاخر            //
  final ageRequestedFromTextController = TextEditingController();
  final ageRequestedToTextController = TextEditingController();
  String? selectedMaritalStatusRequested;
  final residenceAreaRequestedController = TextEditingController();
  String? selectedEducationalLevelRequested;
  int? selectedWeightRequested;
  int? selectedRequestedSkinColor;
  final emailTextController = TextEditingController();

///////////////////////////..........//////////////////////////////////////////

  int _currentPageIndex = 0;
  int currentPage = 0;
  int? selectedAcceptOtherNationality;

  bool isLoading = false;
  final heightRequesterTextController = TextEditingController();
  final qualificationRequesterTextController = TextEditingController();
  final cityRequesterTextController = TextEditingController();
  final jobRequesterTextController = TextEditingController();
  final financialStateRequesterTextController = TextEditingController();

  final phoneTextController = TextEditingController();
  final nameRequestedTextController = TextEditingController();

  final heightRequestedTextController = TextEditingController();
  final weightRequestedTextController = TextEditingController();
  final qualificationRequestedTextController = TextEditingController();
  final cityRequestedTextController = TextEditingController();
  final nationalityRequestedTextController = TextEditingController();
  TextEditingController jobRequestedTextController = TextEditingController();
  final financialStateRequestedTextController = TextEditingController();
  final emailRequestedTextController = TextEditingController();

  bool male = false;
  bool female = false;
  late List<GlobalKey> keys = [
    homeKey,
    firstNameRequesterKey,
    secondNameRequesterKey,
    titleRequesterKey,
    mobileNumberRequesterKey,
    ganderRequesterKey,
    nationalityRequesterKey,
    weightRequesterKey,
    ageRequesterKey,
    skinColorRequesterKey,
    employmentStatusRequesterKey,
    commitmentDegreeRequesterKey,
    tribeRequesterKey,
    tribeNameRequesterKey,
    isSmokerRequesterKey,
    maritalStatusRequesterKey,
    educationalLevelRequesterKey,
    mariageTypeRequesterKey,
    residenceAreaRequesterKey,
    originRegionRequesterKey,
    acceptAnotherNationalityRequesterKey,
    talkAboutYourSelfRequesterKey,
    //            الشروط المطلوبه في الطرف الاخر            ///////////////////
    ageRequestedKey,
    maritalStatusRequestedKey,
    residenceAreaRequestedKey,
    educationalLevelRequestedKey,
    weightRequestedKey,
    skinColorRequestedKey,
    // انهاء التسجيل
    emailKey,
    savedKey,
  ];
  final List<String> arabNationalitiesList = [
    'مصر',
    'السعودية',
    'العراق',
    'المغرب',
    'اليمن',
    'سوريا',
    'تونس',
    'الأردن',
    'الإمارات',
    'لبنان',
    'ليبيا',
    'فلسطين',
    'عمان',
    'الكويت',
    'قطر',
    'البحرين',
  ];
  final List<String> maritalStatusRequesterList = [
    'عزباء',
    'مطلقة',
    'مطلقة بأولاد',
    'أرملة',
  ];
  final List<String> educationalLevelList = [
    'دبلوم',
    'بكالوريوس',
    'ماجستير',
    'دكتوراه',
    'أقل من دبلوم',
    'لا يهم',
  ];
  final List<String> mariageTypeList = [
    'معلن',
    ' غير معلن',
    'حسب رغبة الطرف الأخر',
  ];
  final List<String> skinColorsList = [
    'بياض شامي',
    'ابيض',
    'حنطي فاتح',
    'حنطي',
    'اسمر',
    'أسود',
    'لا يهم',
  ];
  final List<String> employmentStatusList = [
    'موظف حكومي',
    'قطاع خاص',
    'بدون وظيفه',
    'رجل اعمال',
    'متقاعد',
  ];
  final List<String> commitmentDegreeRequesterList = [
    'ملتزم جدا',
    'ملتزم',
    'محافظ',
    'وسطي التدين',
    'غير ملتزم',
  ];
  final List<String> tribeList = [
    'قبيلي ينتهي بقبيلة',
    'قبيلي ينتهي بعائله',
    'غير قبلي',
  ];
  final List<String> isSmokerList = [
    'نعم',
    'لا',
  ];
  final List<String> acceptOtherNathonalityList = [
    'نعم',
    'لا',
  ];
  final List<String> maritalStatusRequestedList = [
    'اعزب',
    'مطلق',
    'مطلق بأولاد',
    'أرمل',
    'متزوج بواحدة',
    'معدد',
  ];
  final List<String> weightRequestedList = [
    'يميل للنحافة',
    'يميل للبدانة',
    'لا يهم',
  ];

  void selectColor(int index) {
    selectedRequesterSkinColor = index;
    notifyListeners();
  }

  void selectSkinColorRequest(int index) {
    selectedRequestedSkinColor = index;
    notifyListeners();
  }

  void selectEmploymentStatus(int index) {
    selectedEmploymentStatus = index;
    notifyListeners();
  }

  void selecteCommitmentDegreeRequester(int index) {
    selectedCommitmentDegreeRequester = index;
    notifyListeners();
  }

  void selectTribe(int index) {
    selectedTribe = index;
    notifyListeners();
  }

  void selectIsSmker(int index) {
    selectedIsSmoker = index;
    notifyListeners();
  }

  void selectAcceptNationality(int index) {
    selectedAcceptOtherNationality = index;
    notifyListeners();
  }

  void selectweightRequested(int index) {
    selectedWeightRequested = index;
    notifyListeners();
  }

  void selectMaritalStatusRequested(int index) {
    selectedAcceptOtherNationality = index;
    notifyListeners();
  }

  void selectMale() async {
    male = true;
    female = false;
    gander = 'ذكر';
    notifyListeners();
  }

  void selectFemale() {
    female = true;
    male = false;
    gander = 'أنثي';
    notifyListeners();
  }

  void selectWeightRequested(int index) {
    selectedWeightRequested = index;
    notifyListeners();
  }

  Future<void> sendOrder(context) async {
    showLoading();
    if (mobileNumberRequesterTextController.text == '' ||
        emailTextController.text == '') {
      hideLoading();
      showDialogEnterData(
        context,
      );
    } else {
      try {
        await FirebaseFirestore.instance.collection('orders').doc().set({
          "requester_data": {
            'first_name_requester': firstNameRequesterTextController.text,
            'second_name_requester': secondNameRequesterTextController.text,
            'titleRequester': titleRequesterTextController.text,
            'mobile_number_requester': mobileNumberRequesterTextController.text,
            'gander_requester': gander,
            'nationalit_requester': selectedNationalityRequester,
            'requester_weight': weightRequesterTextController.text,
            'requester_age': ageRequesterTextController.text,
            'requester_skin_color':
                skinColorsList[selectedRequesterSkinColor!].toString(),
            'selected_employment_status':
                employmentStatusList[selectedEmploymentStatus!].toString(),
            'selected_commitment_degree_requester':
                commitmentDegreeRequesterList[
                        selectedCommitmentDegreeRequester!]
                    .toString(),
            'selected_tribe': tribeList[selectedTribe!].toString(),
            'tribeNameRequester': tribeNameRequesterTextController.text,
            'selected_is_smoker': tribeList[selectedIsSmoker!].toString(),
            'selected_marital_status_equester': selectedMaritalStatusRequester,
            'selected_educational_level_requester':
                selectedEducationalLevelRequester,
            'residence_area_requester':
                residenceAreaRequesterKeyController.text,
            ' origin_region_requester': originRegionRequesterController.text,
            'selectedmariageTypelRequester': selectedmariageTypelRequester,
            'talk_about_your_self': talkAboutYourSelfTextController.text,
            'email': emailTextController.text
          },
          "requested_data": {
            'age_requested_from': ageRequestedFromTextController.text,
            'age_requested_to': ageRequestedToTextController.text,
            'selected_marital_status_requested': selectedMaritalStatusRequested,
            'residence_area_requested_controller':
                residenceAreaRequestedController.text,
            'selected_educational_level_requested':
                selectedEducationalLevelRequested,
            'selected_weightRequested':
                weightRequestedList[selectedWeightRequested!],
            'selected_requested_skin_color':
                skinColorsList[selectedRequestedSkinColor!],
          },
        });
        hideLoading();
        showStatusDialog(context, true);
      } catch (e) {
        hideLoading();
        showStatusDialog(context, false);
      }
    }
  }

  void scrollTo(GlobalKey<State<StatefulWidget>> firstNameRequesterKey) {
    Scrollable.ensureVisible(
      firstNameRequesterKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
    notifyListeners();
  }

  void showLoading() async {
    isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  void scrollToIndex(int index) {
    if (index >= 0 && index < keys.length) {
      Scrollable.ensureVisible(
        keys[index].currentContext!,
        duration: const Duration(seconds: 1),
      );
      _currentPageIndex = index;
    }
  }

  void scrollToNext() {
    if (_currentPageIndex < keys.length - 1) {
      scrollToIndex(_currentPageIndex + 1);
    }
  }

  void scrollToPrevious() {
    if (_currentPageIndex > 0) {
      scrollToIndex(_currentPageIndex - 1);
    }
  }
}
