import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/responsive.dart';
import '../../../main.dart';
import 'widgets.dart';

class ContactsWidgets extends StatelessWidget {
  ContactsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 5,
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
            child: Center(
              child: MyText(
                fontSize: setFont(context, 12),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fieldName: 'تواصل معنا',
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.black,
              size: setFont(context, 20),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.facebook,
                color: Colors.black,
                size: setFont(context, 20),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.envelope,
              color: Colors.black,
              size: setFont(context, 20),
            ),
          ),
        ),
        Spacer(
          flex: Res.isMobile(context) ? 6 : 25,
        ),
      ],
    );
  }
}
