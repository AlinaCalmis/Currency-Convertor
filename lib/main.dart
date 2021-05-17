import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CurrencyConvertor());
}

class CurrencyConvertor extends StatefulWidget {
  CurrencyConvertor({Key key}) : super(key: key);

  @override
  _CurrencyConvertorState createState() => _CurrencyConvertorState();
}

class _CurrencyConvertorState extends State<CurrencyConvertor> {

  TextEditingController _controller = TextEditingController();
  double value = 0.0;
  String converted = "";
  bool isNumber = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text('Currency Convertor'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
                'https://www.forbes.ro/wp-content/uploads/2020/06/shutterstock_1305075382-525x350.jpg',
            ),

            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Enter the amount in EUR',
                  errorText: (isNumber == true) ? null : "Please enter a number"
              ),
              keyboardType: TextInputType.number,
              onChanged: (String val){
                  setState(() {
                    value = double.tryParse(val)?.toDouble();
                    if (value == null) isNumber = false;
                    else isNumber = true;
                    print(value);

                  });
              },
            ),
            TextButton(
              child: Text('CONVERT!',style: TextStyle(fontSize: 16.0, color: Colors.black),),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black12,
                  minimumSize: Size(100, 40)
              ),
              onPressed: (){
                setState(() {
                  value = value * 4.50;
                  converted = value.toString() + " RON";
                });
                print(converted);
              },
            ),
            Text(converted, textAlign: TextAlign.center,textScaleFactor: 2.0,),
          ],
        ),
      ),
    );
  }

}
