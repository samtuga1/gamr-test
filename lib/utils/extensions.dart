extension Ordinal on int {
  String toOrdinal() {
    if ((this < 0)) {
      //here you change the range
      throw Exception('Invalid number: Number must be a positive number');
    }
    if (this == 0) {
      return '0';
    }

    String stringValue = toString();

    switch (stringValue[stringValue.length - 1]) {
      case '1':
        return '${stringValue}st';
      case '2':
        return '${stringValue}nd';
      case '3':
        return '${stringValue}rd';
      default:
        return '${stringValue}th';
    }
  }
}

extension Month on int {
  static Map<int, String> monthsInYear = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: 'August',
    9: 'September',
    10: "October",
    11: 'November',
    12: "December"
  };

  String monthInWords() => monthsInYear[this]!;
}
