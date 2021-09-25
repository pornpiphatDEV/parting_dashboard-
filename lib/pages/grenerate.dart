import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class GeneratePage extends StatefulWidget {
  final String valueFromMian;
 const GeneratePage({
    Key key,
    this.valueFromMian,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData =
      "https://github.com/neon97"; // already generated qr code when the page opens

  // var qrData = "${widget.valueFromMian}";
  @override
  void initState() {
    super.initState();

    var qrData= widget.valueFromMian;
    print("${widget.valueFromMian}");
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor:Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'QR Code เข้าสู่ลานจอดรถ',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: QrImage(
                  data: widget.valueFromMian,
                  version: QrVersions.auto,
                  size: 250,
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  "*หมายเหตุ สแกนคิวอาร์โค้ดหลังจากเวลาจองไม่เกิน 1 ชั่วโมง 15นาที",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.red),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: Center(
                  child: Container(
                    height: 40,
                    // width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text('15.00.00' , style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                // shape: RoundedRectangleBorder(
                //     side: BorderSide(color: Colors.blue, width: 3.0),
                //     borderRadius: BorderRadius.circular(20.0)),
                // child: FlatButton(
                //   padding: EdgeInsets.all(15.0),
                //   onPressed: () async {
                //     if (qrdataFeed.text.isEmpty) {
                //       //a little validation for the textfield
                //       setState(() {
                //         qrData = "";
                //       });
                //     } else {
                //       setState(() {
                //         qrData = qrdataFeed.text;
                //       });
                //     }
                //   },
                //   child: Text(
                //     "Generate QR",
                //     style: TextStyle(
                //         color: Colors.blue, fontWeight: FontWeight.bold),
                //   ),
                //   shape: RoundedRectangleBorder(
                //       side: BorderSide(color: Colors.blue, width: 3.0),
                //       borderRadius: BorderRadius.circular(20.0)),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}
