import 'package:finance_app/screens/Home.dart';
import 'package:finance_app/widgets/SavingPercent.dart';
import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Container(
                  alignment: Alignment.topRight,
                  margin:
                      const EdgeInsets.only(bottom: 30.0, right: 51.0, top: 30),
                  child: Text(
                    " خطة إدخار",
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextField(
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'مالذي تريد ادخاره',
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
                Text("${date.year}/ ${date.month}/ ${date.day}"),

                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: OutlinedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030));

                      if (newDate == null) return;
                      setState(() {
                        date = newDate;
                      });
                      // print(text?.data);
                      print(date);
                    },
                    child: Text(
                      "اختار التاريخ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // SizedBox(
                //   width: 400,
                //   height: 45.28,
                //   // child: OutlinedButton.icon(
                //   //   onPressed: () async {
                //   DateTime? newDate = await showDatePicker(
                //       context: context,
                //       initialDate: date,
                //       firstDate: DateTime(2000),
                //       lastDate: DateTime(2100));
                // },
                //   //   icon: Icon(Icons.date_range_outlined),
                //   //   label: Text("${date.day}/${date.month}/${date.year}"),
                //   // ),
                // ),

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
                  height: 200,
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
                            Navigator.pop(context);
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
