import 'package:moneys/src/enums/money_transaction_method.dart';
import 'package:test/test.dart';

void main() {
  group('the transitive and symmetric properties:', () {
    test('the transitive property: if [b] = [a] and [c] = [b], then [c] = [a]',
        () {
      for (final MoneyTransactionMethod method
          in MoneyTransactionMethod.values) {
        final MoneyTransactionMethod a = method;
        final MoneyTransactionMethod b = a;
        final MoneyTransactionMethod c = b;
        expect(c, a);
      }
    });
    test('the symmetric property: if [a] = [b], then [b] = [a]', () {
      for (final MoneyTransactionMethod method
          in MoneyTransactionMethod.values) {
        final MoneyTransactionMethod a = method;
        final MoneyTransactionMethod b = method;
        expect(a, b);
        expect(b, a);
      }
    });
  });

  group('uniqueness', () {
    test(
        'all money transaction methods should have a unique [englishName]'
        ' property', () {
      final Set<String> englishNames = Set.from(
        MoneyTransactionMethod.values.map((final method) => method.englishName),
      );
      expect(
        englishNames.length,
        MoneyTransactionMethod.values.length,
      );
    });
  });

  group('factory MoneyTransactionMethod.parse', () {
    test('with a valid string: [name]', () {
      expect(
        MoneyTransactionMethod.parse('bankdraft'),
        MoneyTransactionMethod.bankdraft,
        reason: 'coincides with the [name]',
      );
    });
    test('with a valid string: [name] (with leading and trailing white spaces)',
        () {
      expect(
        MoneyTransactionMethod.parse(' BANKDRAFT '),
        MoneyTransactionMethod.bankdraft,
        reason: 'coincides with the [name] apart from the leading and trailing'
            ' white spaces',
      );
    });
    test('with a valid string: [englishName]', () {
      expect(
        MoneyTransactionMethod.parse('Peer-To-Peer'),
        MoneyTransactionMethod.peertopeer,
        reason: 'coincides with the [englishName]',
      );
    });
    test(
        'with a valid string: [englishName] (with leading and trailing white'
        ' spaces)', () {
      expect(
        MoneyTransactionMethod.parse(' PEER-TO-PEER '),
        MoneyTransactionMethod.peertopeer,
        reason: 'coincides with the [englishName] apart from the leading and'
            ' trailing white spaces',
      );
    });
    test('with all possible values', () {
      for (final MoneyTransactionMethod method
          in MoneyTransactionMethod.values) {
        expect(MoneyTransactionMethod.parse(method.name), method);
        expect(MoneyTransactionMethod.parse(method.englishName), method);
        expect(MoneyTransactionMethod.parse(method.toString()), method);
      }
    });
    test('with an invalid string', () {
      expect(
        () => MoneyTransactionMethod.parse('invalid string'),
        throwsA(
          isA<FormatException>()
              .having(
                (final e) => e.message,
                'message',
                contains('invalid string'),
              )
              .having(
                (final e) => e.message,
                'message',
                contains('MoneyTransactionMethod'),
              ),
        ),
        reason: 'does not coincide with any of the following properties: [name]'
            ' or [englishName]',
      );
    });
  });

  group('@override int compareTo', () {
    test('with different values', () {
      expect(
        MoneyTransactionMethod.bankdraft
            .compareTo(MoneyTransactionMethod.banktransfer),
        isNegative,
        reason: '“bankdraft” comes before “banktransfer” in alphabetical order',
      );
      expect(
        MoneyTransactionMethod.debitcard
            .compareTo(MoneyTransactionMethod.debitcard),
        isZero,
        reason: '“debitcard” and “debitcard” are the same word',
      );
      expect(
        MoneyTransactionMethod.digitalwallet
            .compareTo(MoneyTransactionMethod.creditcard),
        isPositive,
        reason:
            '“digitalwallet” comes after “creditcard” in alphabetical order',
      );
    });
  });

  group('@override String toString:', () {
    test('conversion to string', () {
      expect(
        MoneyTransactionMethod.mobilepayment.toString(),
        'mobilepayment',
        reason: 'the [name] property is “mobilepayment”',
      );
    });
    test('must match [name]', () {
      for (final MoneyTransactionMethod method
          in MoneyTransactionMethod.values) {
        expect(method.toString(), method.name);
      }
    });
    test(
        'the resulting string can be parsed back using'
        ' [MoneyTransactionMethod.parse] in all cases', () {
      for (final MoneyTransactionMethod method
          in MoneyTransactionMethod.values) {
        expect(
          MoneyTransactionMethod.parse(method.toString()),
          method,
          reason: 'the resulting string of [method] can be parsed back to the'
              ' corresponding [MoneyTransactionMethod] value',
        );
      }
    });
  });
}
