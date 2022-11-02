import 'package:finance_app/screens/Home.dart';
import 'package:finance_app/widgets/SavingPercent.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finance_app/controllers/userController.dart';
import 'package:finance_app/models/saving.dart';

class NewSaving extends StatefulWidget {
  const NewSaving({super.key});

  @override
  State<NewSaving> createState() => _nextRouteState();
}

class _nextRouteState extends State<NewSaving> {

  @override
  Widget build(BuildContext context) {
    var _color = Color.fromRGBO(51, 64, 79, 0.5);
    DateTime date = DateTime.now();
    Text? text;
    final TextEditingController _myControllerName = TextEditingController();
    TextEditingController dateinput = TextEditingController();
    final userController = Get.find<UserController>();


    var rtl = TextDirection.RTL;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: (AssetImage("assets/images/background.png")),
                fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.only(top: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 20),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 500),
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
                  alignment: Alignment.topRight,
                  margin:
                      const EdgeInsets.only(bottom: 30.0, right: 30.0, top: 30),
                  child: Text(
                    " خطة إدخار",
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 260),
                  child: Text(
                    "إضافة التاريخ",
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //  CupertinoRoundedDatePicker()

//                 SizedBox(
//                   height: 55,
//                   width: 400,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: Colors.grey, width: 1), //<-- SEE HERE
//                         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
//
//                       ),
//
//
//                       onPressed: () async {
//                         DateTime? newDate = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime(2022),
//                             lastDate: DateTime(2030)
//                         );
//
//                         if (newDate == null) return;
//                         setState(() {
//                           date = newDate;
// //                          Text("${date.year}/ ${date.month}/ ${date.day}");
//
//                         });
//                         // print(text?.data);
//                         print(date);
//                       },
//                       child: Text(
//                         "اختار التاريخ ",
//                         style: TextStyle(color: Colors.black),
//                       ),
//
//                     ),
//                   ),
//                 ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextFormField(
                      textAlign: TextAlign.end,
                      controller: dateinput,
                      obscureText: true,
                      decoration: InputDecoration(
                        // hintTextDirection: textDirectionToAxisDir
                        prefixIcon:
                            Icon(Icons.calendar_today), //icon of text field
                        labelText: "ادخل التاريخ",
                        hintText: dateinput.text,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //label text of field
                      ),

//                    readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2030));

                        if (pickedDate != null) {
                          setState(() {
                            (dateinput.text = DateFormat("yyyy-dd-mm")
                                .format(DateTime.now()));
                          });
                        } else {
                          print("Date is not selected");
                        }
                      }),
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (Container(
                            child: SavingWidget(
                                text: Text(
                          "5%",
                          style: TextStyle(color: Colors.white),
                        )))),
                        Container(
                            child: SavingWidget(
                                text: Text("10%",
                                    style: TextStyle(color: Colors.white)))),
                        Container(
                            child: SavingWidget(
                                text: Text(
                          "15%",
                          style: TextStyle(color: Colors.white),
                        ))),
                        Container(
                            child: SavingWidget(
                                text: Text("20%",
                                    style: TextStyle(color: Colors.white)))),
                        Container(
                            child: SavingWidget(
                                text: Text(
                          "25%",
                          style: TextStyle(color: Colors.white),
                        ))),
                        Container(
                            child: SavingWidget(
                          text: Text(
                            "30%",
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: SizedBox(
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
                            userController.addSavings(new Saving(
                                percenst: num.parse(userController.selectedPercent.toString().replaceAll("%", ""))/100,
                                title: _myControllerName.text,
                                fromDate:"dateinput.text"),);
                            Navigator.of(context).push(_createRouteHomePage());

                          },
                          child: Text("حفظ", style: TextStyle(fontSize: 20)),
                        )))
              ],
            ),
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
