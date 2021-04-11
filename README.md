# big_numbers

- Used to shorten numbers phrases
- Example:
  -  24,532,532 => 24.5M
  -  7,323,232,523 => 7.3B
  -  13,324 => 13.3K

- You can also add commas to numbers
- Example:
    ```24532532``` => Becomes: ```24,532,532```

To use the package, import the following path:

```import 'package:big_numbers/big_numbers.dart'```

To convert big numbers into short phrases, you can use the following:

```Text(simplifyNumber('393849257')),```

To add commas to a string, you can use the following:

```Text(addNumberCommas('393849257')),```

Check out this example:
```
import 'package:flutter/material.dart';
import 'package:big_numbers/big_numbers.dart';

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
```

If there are any issues, then please don't hesitate to notify me about it or 
simply file an issue on [GitHub](https://github.com/ziyadfarhan296/big_numbers/issues).