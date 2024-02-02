import 'package:moneys/src/exceptions/invalid_exchange_rate_exception.dart';
import 'package:test/test.dart';

void main() {
  group('@override String toString:', () {
    test('must return the string contained in the [message] property', () {
      const InvalidExchangeRateException exception =
          InvalidExchangeRateException('The message of the exception.');
      expect(
        exception.toString(),
        exception.message,
      );
    });
  });
}
