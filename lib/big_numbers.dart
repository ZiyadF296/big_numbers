library big_numbers;

///Simplifies a number into shorter phrases
/// - Ex. 1,203 => 1.2K
/// - Ex. 14,593 => 14.5K

/// Will return the same string value if number is less than 1000

/// Expects a string formatted number and will return a string value.
/// Number needs to be under 1 quadrillion

String simplifyNumber(String value) {
  value.contains(RegExp(r'[a-zA-Z]'));
  String _cleanedValue = value.replaceAll(RegExp(r','), ' ');
  if (int.parse(_cleanedValue) >= 1000) {
    int _length = _cleanedValue.length;
    return _numberCountLogic(_length, _cleanedValue);
  }

  ///Returns the same value if it's less than 1 thousand
  return value;
}

///Logic that returns the string that the user will see.

///Combines the values provided depending on length.
///Returns end letter which is short for:
///- Thousand = K
///- Million = M
///- Billion = B
///- Trillions = B

String _numberCountLogic(int length, String value) {
  ///Forms the string that will be returned at the end of computation.
  ///Logic will calculate the value of the string such as length.
  ///Decimal will also be included if it's not a '0'

  /// Example:
  ///  If the number is not too great to have a none 0 decimal, then it will return
  ///  without a decimal place.
  /// - 24094 => 24K
  //
  ///  However, if the number does have a none 0 decimal value, then
  ///  the decimal will be shown.
  /// - 24394 => 24.3K
  return '${value.substring(0, _getSubStringValue(length))}${value[_getSubStringValue(length)] == '0' ? '' : '.' + value[_getSubStringValue(length)]}${_returnNumberLetter(length)}';
}

///Returns the number letter depending on length

String _returnNumberLetter(int length) {
  ///Thousand(s)
  if (length >= 4 && length <= 6) return 'K';

  ///Million(s)
  if (length >= 7 && length <= 9) return 'M';

  ///Billion(s)
  if (length >= 10 && length <= 12) return 'B';

  ///Trillion(s)
  if (length >= 13 && length <= 15) return 'T';
  return '';
}

int _getSubStringValue(int length) {
  ///If the length is less than 7 (meaning it's a thousand(s))
  if (length < 7) return length - 3;

  ///If the length is less than 10 but more than 6 (meaning it's a million(s))
  if (length >= 7 && length <= 9) return length - 6;

  ///If the length is less than 13 but more than 9 (meaning it's a billion(s))
  if (length >= 10 && length <= 12) return length - 9;

  ///If the length is less than 16 but more than 12 (meaning it's a trillion(s))
  if (length >= 13 && length <= 15) return length - 12;
  return 1;
}

///Expects a string value.
///Will add a comma in every 3 characters of the string.

String addNumberCommas(String value) {
  ///Returns the string provided with commas added.
  return value.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}
