import 'package:flutter/material.dart';

// Add button to include in insight page

Widget addBtnWidget(BuildContext context) {
  return SizedBox(
    width: 70,
    height: 37,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: Color.fromRGBO(51, 64, 79, 1),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle: TextStyle(fontFamily: 'HacenDigital',fontSize: 14, fontWeight: FontWeight.w600)),
      child: Text("إضافة"),
      onPressed: () {},
    ),
  );
}
