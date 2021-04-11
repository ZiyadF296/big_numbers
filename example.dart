import 'package:flutter/material.dart';
import 'lib/big_numbers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static String exampleNumber = '4802347839';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(simplifyNumber(exampleNumber)),
              SizedBox(height: 20),
              Text(addNumberCommas(exampleNumber)),
            ],
          ),
        ),
      ),
    );
  }
}
