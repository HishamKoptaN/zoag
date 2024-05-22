import 'package:flutter/material.dart';

void showDialogEnterData(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('فشل  '),
        content: Text('أدخل رقم الموبيل والايميل للتواصل '),
        actions: [
          TextButton(
            child: const Text('اوك'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
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
