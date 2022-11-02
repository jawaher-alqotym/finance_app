import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/Home.dart';
import 'package:string_validator/string_validator.dart';


class OnBoardingPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 64, 79, 1),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(26),
                        bottomRight: Radius.circular(26))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset('assets/undraw_treasure_of-9-i 1.svg',
                        width: 250, height: 212)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      text: 'قروش ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Color.fromRGBO(83, 210, 88, 1)),
                      children: const <TextSpan>[
                        TextSpan(
                            text: '''.. لدعم أحلامك 
                        المالية''',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1))),
                      ],
                    )),
              ),
              Spacer(),
              SizedBox(
                width: 316,
                height: 54,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (value){
                    // check if the value contains only letters for name
                    if(value!.isNotEmpty && isAlpha(value) && value.length<=30){
                      return null; // everything is correct
                    } else if(value!.isEmpty){
                      return "يجب ادخال الإسم";
                    } else{
                      return "ادخل الإسم بشكل صحيح";
                    }

                  },
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'الاسم',
                    hintStyle:
                    TextStyle(color: Color.fromRGBO(128, 128, 128, 1)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(83, 210, 88, 1),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(83, 210, 88, 1),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 316,
                height: 54,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (value){
                    // check if the value contains only int or float for balance
                    if(value!.isNotEmpty && value.length<=10 && (isInt(value) || isFloat(value))){
                      return null; // everything is correct
                    } else if(value!.isEmpty){
                      return "يجب ادخال المبلغ";
                    } else{
                      return "ادخل المبلغ بشكل صحيح";
                    }

                  },
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'ادخل المبلغ',
                    hintStyle:
                    TextStyle(color: Color.fromRGBO(128, 128, 128, 1)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(83, 210, 88, 1),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(83, 210, 88, 1),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 62.0),
                child: SizedBox(
                  width: 316,
                  height: 45.28,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Color.fromRGBO(83, 210, 88, 1),
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    child: Text(
                      "بدء",
                      style: TextStyle(
                          color: Color.fromRGBO(51, 64, 79, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        Navigator.of(context).push(_createRouteHomePage());
                      }
                    },
                  ),
                ),
              ),
              Spacer(),
              Spacer(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRouteHomePage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Home(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
