import 'package:budget_tracker_ui/json/create_budget_json.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CreatBudgetPage extends StatefulWidget {
  @override
  _CreatBudgetPageState createState() => _CreatBudgetPageState();
}

class _CreatBudgetPageState extends State<CreatBudgetPage> {
  int activeCategory = 0;
  TextEditingController _budgetName =
      TextEditingController(text: "2021-8-1 15:20:00");
  TextEditingController _budgetPrice = TextEditingController(text: "20 บาท");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              "จองที่จอดรถ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(width: 2, color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.01),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                              top: 1,
                            ),
                            child: Center(
                              child: Image.asset(
                                categories[0]['icon'],
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 1, right: 40),
                          child: Text(
                            "จำนวนช่องจอดที่ว่าง",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),

                        // Icon(AntDesign.search1)s
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Center(
                        child: Text(
                          "5",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "เวลาที่เข้าจอด",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff67727d)),
                ),
                Text(
                  "*หมายเหตุ สแกนคิวอาร์โค้ดหลังจากเวลาจองไม่เกิน 1 ชั่วโมง 15นาที",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Colors.red),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: _budgetName,
                  cursorColor: black,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ชำระค่าการจองจำนวน  20 บาท",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xff67727d)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  print('ยืนยันการจอง');
                  showAlert(context);
                },
                child:
                    const Text('ยืนยันการจอง', style: TextStyle(fontSize: 20)),
                color: Colors.green,
                textColor: Colors.white,
                elevation: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('คุณต้องการจองที่จอดรถ')),
          content: Text(
            "การจอดที่จอดรถเสียค่าบริการจำนวน 20 บาท ถ้ามาไม่ได้ตามเวลาที่กำหนด 1ชั่วโมงเราจะถือว่าสละสิทธิ์การจองทันที",
            style: TextStyle(color: Colors.blueGrey[300]),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0))),
          actions: <Widget>[
            FlatButton(
              child: Text("ยืนยัน", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
                showAlert2(context);
              },
            ),
            FlatButton(
              child: Text("ยกเลิก", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }




    showAlert2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('คุณได้ทำการจองเสร็จ')),
          content: Text(
            "ระบบได้ทำการชำระเงินจำนวน 20 บาทเสร็จสิ้น",
            style: TextStyle(color: Colors.blueGrey[300]),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0))),
          actions: <Widget>[
            FlatButton(
              child: Text("ตกลง", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
