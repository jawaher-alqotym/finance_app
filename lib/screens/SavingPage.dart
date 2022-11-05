import 'package:finance_app/controllers/userController.dart';
import 'package:finance_app/models/saving.dart';
import 'package:finance_app/screens/Home.dart';
import 'package:finance_app/widgets/SavingPercent.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class SavingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SavingPage();
  }
}

class _SavingPage extends State<SavingPage> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController _myControllerName = TextEditingController();
  final userController = Get.find<UserController>();

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: (AssetImage("assets/images/background.png")),
                    fit: BoxFit.cover)),
            child: Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(26)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          iconSize: 35,
                          onPressed: () {
                            Navigator.of(context).push(_createRouteHomePage());
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Color.fromRGBO(83, 210, 88, 1),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 40, top: 0, bottom: 20),
                          child: Text(
                            " خطة إدخار",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            textAlign: TextAlign.end,
                            controller: _myControllerName,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'مالذي تريد ادخاره',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, top: 30),
                          child: Text(
                            "اختار التاريخ ",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(15),
                          child: Center(
                              child: TextField(
                            textAlign: TextAlign.right,
                            controller: dateinput,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_today),
                              // labelText: "ادخل التاريخ",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2030));

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);

                                setState(() {
                                  dateinput.text = formattedDate;
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ))),
                      Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SavingWidget(
                                    text: Text(
                                  "5%",
                                  style: TextStyle(color: Colors.white),
                                )),
                                SavingWidget(
                                    text: Text("10%",
                                        style: TextStyle(color: Colors.white))),
                                SavingWidget(
                                    text: Text(
                                  "15%",
                                  style: TextStyle(color: Colors.white),
                                )),
                                SavingWidget(
                                    text: Text("20%",
                                        style: TextStyle(color: Colors.white))),
                                SavingWidget(
                                    text: Text(
                                  "25%",
                                  style: TextStyle(color: Colors.white),
                                )),
                                SavingWidget(
                                  text: Text(
                                    "30%",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ])),
                      SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        width: 316,
                        height: 45.28,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:
                                Color.fromRGBO(83, 210, 88, 1), // background
                            onPrimary: Color.fromRGBO(51, 64, 79, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.88),
                            ),
                            // foreground
                          ),
                          onPressed: () {
                            userController.addSavings(
                              new Saving(
                                  percenst: num.parse(userController
                                          .selectedPercent
                                          .toString()
                                          .replaceAll("%", "")) /
                                      100,
                                  title: _myControllerName.text,
                                  fromDate: "dateinput.text"),
                            );
                            Navigator.of(context).push(_createRouteHomePage());
                          },
                          child: Text("حفظ", style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ))));
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
