import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverter());
}

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _controller = TextEditingController();
  double _value = 0.0;
  String _converted = '';
  bool _isNumber = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Currency Converter'),
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
                  errorText:
                      (_isNumber == true) ? null : 'Please enter a number'),
              keyboardType: TextInputType.number,
              onChanged: (String val) {
                setState(() {
                  _value = double.tryParse(val)!.toDouble();
                  if (_value == null)
                    _isNumber = false;
                  else
                    _isNumber = true;
                });
              },
            ),
            TextButton(
              child: const Text(
                'CONVERT!',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black12, minimumSize: const Size(100, 40)),
              onPressed: () {
                setState(() {
                  _value = _value * 4.50;
                  _converted = _value.toString() + ' RON';
                });
              },
            ),
            Text(
              _converted,
              textAlign: TextAlign.center,
              textScaleFactor: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
