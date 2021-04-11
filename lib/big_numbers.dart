library big_numbers;

///Simplifies a number into shorter phrases
/// - Ex. 1,203 => 1.2K
/// - Ex. 14,593 => 14.5K
///
/// Expects a string formatted number and will return a string value.
/// Number needs to be under 1 quadrillion

String simplifyNumber(String value) {
  if (int.parse(value) >= 1000) {
    int _length = value.length;
    return _numberCountLogic(_length, value);
  }
  ///Returns the same value if it's less than 1 thousand
  return value;
}

///Logic that returns the string that the user will see

///Combines the values provided depending on length.
///Returns end letter which is short for:
///- Thousand = K
///- Million = M
///- Billion = B
///- Trillions = B

String _numberCountLogic(int length, String value) {
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
  if (length < 7) return length - 3;
  if (length >= 7 && length <= 9) return length - 6;
  if (length >= 10 && length <= 12) return length - 9;
  if (length >= 13 && length <= 15) return length - 12;
  return 1;
}

///Expects a string value.
///Will add a comma in every 3 characters of the string.

String addNumberCommas(String value) {
  return value.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}
