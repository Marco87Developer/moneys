import 'package:moneys/src/exceptions/exception_messages.dart';
import 'package:test/test.dart';

void main() {
  group('parseFormatExceptionMessage:', () {
    test(
        'it must return a string that contains the enum name and the invalid'
        ' string, that cannot be parsed', () {
      expect(
        parseFormatExceptionMessage('Invalid string', 'Currency'),
        contains('Invalid string'),
      );
      expect(
        parseFormatExceptionMessage('Invalid string', 'Currency'),
        contains('Currency'),
      );
    });
  });
}
