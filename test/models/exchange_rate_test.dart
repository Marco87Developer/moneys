import 'dart:io';

import 'package:moneys/src/enums/currency.dart';
import 'package:moneys/src/models/exchange_rate.dart';
import 'package:test/test.dart';

void main() {
  group('the transitive and symmetric properties:', () {
    test('the transitive property: if [b] = [a] and [c] = [b], then [c] = [a]',
        () {
      final ExchangeRate a = ExchangeRate(
        dateTime: DateTime(2023, 9, 3),
        from: Currency.eur,
        to: Currency.usd,
        value: 1.05,
      );
      final ExchangeRate b = a;
      final ExchangeRate c = b;
      expect(c, a);
    });
    test('the symmetric property: if [a] = [b], then [b] = [a]', () {
      final ExchangeRate a = ExchangeRate(
        dateTime: DateTime(2023, 9, 3),
        from: Currency.eur,
        to: Currency.usd,
        value: 1.05,
      );
      final ExchangeRate b = ExchangeRate(
        dateTime: DateTime(2023, 9, 3),
        from: Currency.eur,
        to: Currency.usd,
        value: 1.05,
      );
      expect(a, b);
      expect(b, a);
    });
  });

  group('factory ExchangeRate.fromJson:', () {
    test(
        'if the JSON string is a valid representation of an [ExchangeRate]'
        ' instance, it must construct that instance', () async {
      final File file1 = File('test/models/exchange_rate_1_test.json');
      final String json1 = await file1.readAsString();
      expect(
        ExchangeRate.fromJson(json1),
        ExchangeRate(
          dateTime: DateTime.utc(2023, 9, 3, 15, 56, 2, 341),
          from: Currency.eur,
          to: Currency.usd,
          value: 1.05,
        ),
        reason: 'there are all the parameters',
      );
      final File file2 = File('test/models/exchange_rate_2_test.json');
      final String json2 = await file2.readAsString();
      expect(
        ExchangeRate.fromJson(json2),
        ExchangeRate(
          dateTime: DateTime(2023, 9, 3, 15, 56, 2, 341),
          from: Currency.eur,
          to: Currency.usd,
          value: 1.05,
        ),
        reason: 'there are all the parameters',
      );
      final File file3 = File('test/models/exchange_rate_3_test.json');
      final String json3 = await file3.readAsString();
      expect(
        ExchangeRate.fromJson(json3),
        ExchangeRate(
          dateTime: DateTime(2023, 9, 3),
          from: Currency.eur,
          to: Currency.usd,
          value: 1.05,
        ),
        reason: 'there are all the parameters',
      );
    });
    test(
        'if the JSON string is an invalid representation of an [ExchangeRate]'
        ' instance, it must throw a [FormatException]', () async {
      final File fileNotValid1 =
          File('test/models/exchange_rate_not_valid_1_test.json');
      final String jsonNotValid1 = await fileNotValid1.readAsString();
      expect(
        () => ExchangeRate.fromJson(jsonNotValid1),
        throwsFormatException,
        reason: 'the [dateTime] parameter is an empty string',
      );
      final File fileNotValid2 =
          File('test/models/exchange_rate_not_valid_2_test.json');
      final String jsonNotValid2 = await fileNotValid2.readAsString();
      expect(
        () => ExchangeRate.fromJson(jsonNotValid2),
        throwsFormatException,
        reason: 'the JSON string does not contain [value] key',
      );
    });
  });

  group('ExchangeRate.fromMap:', () {
    test(
        'if the map is a valid representation of an [ExchangeRate] instance, it'
        ' must construct that instance', () {
      expect(
        ExchangeRate.fromMap(const <String, dynamic>{
          'dateTime': '2023-09-04T14:39:30.314Z',
          'from': 'eur',
          'to': 'cop',
          'value': 4500.1234567,
        }),
        ExchangeRate(
          dateTime: DateTime.utc(2023, 9, 4, 14, 39, 30, 314),
          from: Currency.eur,
          to: Currency.cop,
          value: 4500.1234567,
        ),
        reason: 'there are all the parameters. [dateTime] is expressed as UTC'
            ' date',
      );
      expect(
        ExchangeRate.fromMap(const <String, dynamic>{
          'dateTime': '2023-09-04',
          'from': 'eur',
          'to': 'cop',
          'value': 4500.1234567,
        }),
        ExchangeRate(
          dateTime: DateTime(2023, 9, 4),
          from: Currency.eur,
          to: Currency.cop,
          value: 4500.1234567,
        ),
        reason: 'there are all the parameters. [dateTime] is expressed in'
            ' “yyyy-mm-dd” format',
      );
    });
    test(
        'if the map is an invalid representation of an [ExchangeRate]'
        ' instance, it must throw a [FormatException]', () {
      expect(
        () => ExchangeRate.fromMap(const <String, dynamic>{
          'dateTime': '',
          'from': 'eur',
          'to': 'cop',
          'value': 4500.1234567,
        }),
        throwsFormatException,
        reason: 'the value for the "dateTime" key is an empty string',
      );
      expect(
        () => ExchangeRate.fromMap(const <String, dynamic>{
          'dateTime': '2023-09-04T16:09:30.314Z',
          'from': '',
          'to': 'cop',
          'value': 4500.1234567,
        }),
        throwsFormatException,
        reason: 'the value for the "from" key is an empty string',
      );
      expect(
        () => ExchangeRate.fromMap(const <String, dynamic>{
          'dateTime': '2023-09-04T16:09:30.314Z',
          'from': 'eur',
          'to': '',
          'value': 4500.1234567,
        }),
        throwsFormatException,
        reason: 'the value for the "to" key is an empty string',
      );
      expect(
        () => ExchangeRate.fromMap(const <String, dynamic>{
          'dateTime': '2023-09-04T16:09:30.314Z',
          'from': 'eur',
          'to': 'cop',
        }),
        throwsFormatException,
        reason: 'the "value" key is not present',
      );
    });
  });

  group('factory ExchangeRate.parse:', () {
    test(
        'if the string is a valid representation of an [ExchangeRate] instance,'
        ' it must construct that instance', () {
      expect(
        ExchangeRate.parse('eur usd 1.1000000 2023-09-04'),
        ExchangeRate(
          dateTime: DateTime(2023, 9, 4),
          from: Currency.eur,
          to: Currency.usd,
          value: 1.1,
        ),
        reason: 'the string is correctly formatted',
      );
      expect(
        ExchangeRate.parse('eur usd 1.1000000 2023-09-04 15:57:01.123456789'),
        ExchangeRate(
          dateTime: DateTime(2023, 9, 4, 15, 57, 1, 123, 456),
          from: Currency.eur,
          to: Currency.usd,
          value: 1.1,
        ),
        reason: 'the string is correctly formatted',
      );
      expect(
        ExchangeRate.parse('eur usd 1.1000000 20230904'),
        ExchangeRate(
          dateTime: DateTime(2023, 9, 4),
          from: Currency.eur,
          to: Currency.usd,
          value: 1.1,
        ),
        reason: 'the string is correctly formatted',
      );
      expect(
        ExchangeRate.parse('eur usd 1.1000000 2023-09-04 15:57:01.123456789Z'),
        ExchangeRate(
          dateTime: DateTime.utc(2023, 9, 4, 15, 57, 1, 123, 456),
          from: Currency.eur,
          to: Currency.usd,
          value: 1.1,
        ),
        reason: 'the string is correctly formatted',
      );
    });
    test(
        'if the string is an invalid representation of an [ExchangeRate]'
        ' instance, it must throw a [FormatException]', () {
      expect(
        () => ExchangeRate.parse('ABCDE usd 1.1000000 2023-09-04'),
        throwsA(
          isA<FormatException>().having(
            (final e) => e.message,
            '',
            contains('ExchangeRate'),
          ),
        ),
        reason: '"ABCDE" is not a valid representation of a [ExchangeRate]',
      );
      expect(
        () => ExchangeRate.parse('eur ABCDE 1.1000000 2023-09-04'),
        throwsA(
          isA<FormatException>().having(
            (final e) => e.message,
            '',
            contains('ExchangeRate'),
          ),
        ),
        reason: '"ABCDE" is not a valid representation of a [ExchangeRate]',
      );
      expect(
        () => ExchangeRate.parse('eur usd A 2023-09-04'),
        throwsA(
          isA<FormatException>().having(
            (final e) => e.message,
            '',
            contains('ExchangeRate'),
          ),
        ),
        reason: '"A" is not a valid representation of a [double]',
      );
      expect(
        () => ExchangeRate.parse('eur usd 1.1 2023A-08-27'),
        throwsA(
          isA<FormatException>().having(
            (final e) => e.message,
            '',
            contains('ExchangeRate'),
          ),
        ),
        reason: 'In the string for the date, there is an invalid "A"',
      );
      expect(
        () => ExchangeRate.parse('eur usd 1.1000000 2023-09-04 ABCD'),
        throwsA(
          isA<FormatException>().having(
            (final e) => e.message,
            '',
            contains('ExchangeRate'),
          ),
        ),
        reason: '"ABCD" is an invalid string for the time',
      );
      expect(
        () => ExchangeRate.parse('eur usd 1.1000000'),
        throwsA(
          isA<FormatException>().having(
            (final e) => e.message,
            '',
            contains('ExchangeRate'),
          ),
        ),
        reason: 'the length of the split string is less than 4',
      );
      expect(
        () => ExchangeRate.parse('eur usd'),
        throwsA(
          isA<FormatException>().having(
            (final e) => e.message,
            '',
            contains('ExchangeRate'),
          ),
        ),
        reason: 'the length of the split string is less than 4',
      );
      expect(
        () => ExchangeRate.parse('eur'),
        throwsA(
          isA<FormatException>().having(
            (final e) => e.message,
            '',
            contains('ExchangeRate'),
          ),
        ),
        reason: 'the length of the split string is less than 4',
      );
      expect(
        () => ExchangeRate.parse(''),
        throwsA(
          isA<FormatException>().having(
            (final e) => e.message,
            '',
            contains('ExchangeRate'),
          ),
        ),
        reason: 'the length of the split string is less than 4',
      );
    });
  });

  group('check:', () {
    final ExchangeRate exchangeRate1 = ExchangeRate(
      dateTime: DateTime.utc(2023, 9, 4, 13, 52),
      from: Currency.eur,
      to: Currency.cop,
      value: 4500.55,
    );
    final ExchangeRate exchangeRate2 = ExchangeRate(
      dateTime: DateTime(2023, 9, 4, 13, 52),
      from: Currency.eur,
      to: Currency.eur,
      value: 1,
    );
    test(
        'must return if this exchange rate can be used to convert a money of a'
        ' certain currency ([from]) into the equivalent money of another'
        ' currency ([to])', () {
      expect(
        exchangeRate1.check(from: Currency.eur, to: Currency.cop),
        isTrue,
        reason: '[exchangeRate1] is for conversion from eur to cop',
      );
      expect(
        exchangeRate2.check(from: Currency.eur, to: Currency.eur),
        isTrue,
        reason: '[exchangeRate2] is for conversion from eur to eur',
      );
      expect(
        exchangeRate1.check(from: Currency.eur, to: Currency.aud),
        isFalse,
        reason: '[exchangeRate1] is for conversion from eur to eur',
      );
      expect(
        exchangeRate1.check(from: Currency.eur, to: Currency.eur),
        isFalse,
        reason: '[exchangeRate1] is for conversion from eur to eur',
      );
      expect(
        exchangeRate2.check(from: Currency.eur, to: Currency.cop),
        isFalse,
        reason: '[exchangeRate2] is for conversion from eur to eur',
      );
    });
  });

  group('copyWith:', () {
    final ExchangeRate exchangeRate = ExchangeRate(
      dateTime: DateTime.utc(2023, 9, 4, 13, 52),
      from: Currency.eur,
      to: Currency.cop,
      value: 4500.55,
    );
    test(
        'creates a copy of this [ExchangeRate] instance but with the given'
        ' fields replaced with the new values', () {
      expect(
        exchangeRate.copyWith(
          dateTime: DateTime(2023),
        ),
        ExchangeRate(
          dateTime: DateTime(2023),
          from: Currency.eur,
          to: Currency.cop,
          value: 4500.55,
        ),
        reason: 'the [dateTime] value must change',
      );
      expect(
        exchangeRate.copyWith(
          from: Currency.aud,
        ),
        ExchangeRate(
          dateTime: DateTime.utc(2023, 9, 4, 13, 52),
          from: Currency.aud,
          to: Currency.cop,
          value: 4500.55,
        ),
        reason: 'the [from] value must change',
      );
      expect(
        exchangeRate.copyWith(
          value: 4557.15,
        ),
        ExchangeRate(
          dateTime: DateTime.utc(2023, 9, 4, 13, 52),
          from: Currency.eur,
          to: Currency.cop,
          value: 4557.15,
        ),
        reason: 'the [value] value must change',
      );
      expect(
        exchangeRate.copyWith(
          dateTime: DateTime.utc(2023),
          from: Currency.aud,
          to: Currency.gbp,
          value: 4557.15,
        ),
        ExchangeRate(
          dateTime: DateTime.utc(2023),
          from: Currency.aud,
          to: Currency.gbp,
          value: 4557.15,
        ),
        reason: 'all the values must change',
      );
    });
  });

  group('toJson:', () {
    test('must create a JSON string representing the [ExchangeRate] instance',
        () {
      expect(
        ExchangeRate(
          dateTime: DateTime.utc(2023, 9, 4, 15, 57, 1, 123, 456),
          from: Currency.eur,
          to: Currency.usd,
          value: 1.1,
        ).toJson(),
        '{"dateTime":"2023-09-04T15:57:01.123456Z","from":"eur","to":"usd",'
        '"value":1.1}',
        reason: 'the [dateTime] is a UTC date',
      );
      expect(
        ExchangeRate.fromJson(
          ExchangeRate(
            dateTime: DateTime.utc(2023, 9, 4, 15, 57, 1, 123, 456),
            from: Currency.eur,
            to: Currency.usd,
            value: 1.1,
          ).toJson(),
        ),
        ExchangeRate(
          dateTime: DateTime.utc(2023, 9, 4, 15, 57, 1, 123, 456),
          from: Currency.eur,
          to: Currency.usd,
          value: 1.1,
        ),
        reason: 'the resulting JSON string can be parsed back using'
            ' [ExchangeRate.fromJson]',
      );
    });
  });

  group('toMap:', () {
    test(
        'creates a [Map<String, dynamic>] representing this [ExchangeRate]'
        ' instance', () {
      expect(
        ExchangeRate(
          dateTime: DateTime.utc(2023, 9, 4, 13, 52),
          from: Currency.eur,
          to: Currency.cop,
          value: 4500.55,
        ).toMap(),
        <String, dynamic>{
          'dateTime': '2023-09-04T13:52:00.000Z',
          'from': 'eur',
          'to': 'cop',
          'value': 4500.55,
        },
        reason: 'the [dateTime] is a UTC date',
      );
      expect(
        ExchangeRate.fromMap(
          ExchangeRate(
            dateTime: DateTime.utc(2023, 9, 4, 13, 52),
            from: Currency.eur,
            to: Currency.cop,
            value: 4500.55,
          ).toMap(),
        ),
        ExchangeRate(
          dateTime: DateTime.utc(2023, 9, 4, 13, 52),
          from: Currency.eur,
          to: Currency.cop,
          value: 4500.55,
        ),
        reason: 'the resulting map can be parsed back using'
            ' [ExchangeRate.fromMap]',
      );
    });
  });

  group('@override int compareTo:', () {
    final ExchangeRate exchangeRate1 = ExchangeRate(
      dateTime: DateTime(2023, 9, 4),
      from: Currency.eur,
      to: Currency.cop,
      value: 4500.55,
    );
    final ExchangeRate exchangeRate2 = ExchangeRate(
      dateTime: DateTime(2023, 9, 4),
      from: Currency.fjd,
      to: Currency.cop,
      value: 4500.55,
    );
    final ExchangeRate exchangeRate3 = ExchangeRate(
      dateTime: DateTime(2023, 9, 4),
      from: Currency.fjd,
      to: Currency.djf,
      value: 4500.55,
    );
    final ExchangeRate exchangeRate4 = ExchangeRate(
      dateTime: DateTime(2023, 9, 3),
      from: Currency.fjd,
      to: Currency.djf,
      value: 4500.55,
    );
    final ExchangeRate exchangeRate5 = ExchangeRate(
      dateTime: DateTime(2023, 9, 3),
      from: Currency.fjd,
      to: Currency.djf,
      value: 4500.57,
    );
    final ExchangeRate exchangeRate6 = ExchangeRate(
      dateTime: DateTime(2023, 9, 3),
      from: Currency.eur,
      to: Currency.aud,
      value: 4500.55,
    );
    final ExchangeRate exchangeRate7 = ExchangeRate(
      dateTime: DateTime(2023, 9, 3),
      from: Currency.eur,
      to: Currency.cop,
      value: 4500.55,
    );
    final ExchangeRate exchangeRate8 = ExchangeRate(
      dateTime: DateTime(2023, 9, 4),
      from: Currency.eur,
      to: Currency.cop,
      value: 4500,
    );
    test(
        'must return a negative value if this exchange rate is smaller than'
        ' other, and a positive value if this exchange rate is greater than'
        ' other. If the two exchange rates are equals, must return 0', () {
      expect(
        exchangeRate1.compareTo(exchangeRate1),
        isZero,
        reason: 'it is the same exchange rate',
      );
      expect(
        exchangeRate1.compareTo(exchangeRate2),
        isNegative,
        reason: '"eur" comes before "fjd" in alphabetical order',
      );
      expect(
        exchangeRate2.compareTo(exchangeRate3),
        isNegative,
        reason: '"cop" comes before "fjd" in alphabetical order',
      );
      expect(
        exchangeRate3.compareTo(exchangeRate4),
        isNegative,
        reason: 'the date 2023-09-03 is before than 2023-09-04 one',
      );
      expect(
        exchangeRate4.compareTo(exchangeRate5),
        isNegative,
        reason: '4500.55 is less than 4500.57',
      );
      expect(
        exchangeRate1.compareTo(exchangeRate6),
        isPositive,
        reason: '"cop" comes after "aud" in alphabetical order',
      );
      expect(
        exchangeRate1.compareTo(exchangeRate7),
        isNegative,
        reason: 'the date 2023-09-04 is after than 2023-09-03 one',
      );
      expect(
        exchangeRate1.compareTo(exchangeRate8),
        isPositive,
        reason: '4500.55 is more than 4500',
      );
    });
  });

  group('@override int get hashCode:', () {
    test('must return the same hash only if the two exchange rates are equals',
        () {
      expect(
        ExchangeRate(
              dateTime: DateTime(2023, 9, 4),
              from: Currency.usd,
              to: Currency.eur,
              value: 1.02,
            ).hashCode ==
            ExchangeRate(
              dateTime: DateTime(2023, 9, 4),
              from: Currency.usd,
              to: Currency.eur,
              value: 1.02,
            ).hashCode,
        isTrue,
        reason: 'all the parameters are equals',
      );
      expect(
        ExchangeRate(
              dateTime: DateTime(2023, 9, 4),
              from: Currency.usd,
              to: Currency.eur,
              value: 1.02,
            ).hashCode ==
            ExchangeRate(
              dateTime: DateTime(2023, 9, 4, 1),
              from: Currency.usd,
              to: Currency.eur,
              value: 1.02,
            ).hashCode,
        isFalse,
        reason: 'the time is different',
      );
    });
  });

  group('@override String toString', () {
    test('the format must be: <from> <to> <value> <ISO 8601 DateTime string>',
        () {
      expect(
        ExchangeRate(
          dateTime: DateTime(2023, 9, 4),
          from: Currency.eur,
          to: Currency.cop,
          value: 4500.55,
        ).toString(),
        'eur cop 4500.55 2023-09-04T00:00:00.000',
        reason: 'the [dateTime] is a local date',
      );
      expect(
        ExchangeRate(
          dateTime: DateTime.utc(2023, 9, 4),
          from: Currency.eur,
          to: Currency.cop,
          value: 4500.55,
        ).toString(),
        'eur cop 4500.55 2023-09-04T00:00:00.000Z',
        reason: 'the [dateTime] is a UTC date',
      );
      expect(
        ExchangeRate.parse(
          ExchangeRate(
            dateTime: DateTime(2023, 9, 3),
            from: Currency.eur,
            to: Currency.usd,
            value: 1.05,
          ).toString(),
        ),
        ExchangeRate(
          dateTime: DateTime(2023, 9, 3),
          from: Currency.eur,
          to: Currency.usd,
          value: 1.05,
        ),
        reason: 'the resulting string can be parsed back using'
            ' [ExchangeRate.parse]',
      );
    });
  });

  group('operators <, <=, ==, >=, >:', () {
    final ExchangeRate exchangeRate1 = ExchangeRate(
      dateTime: DateTime(2023, 9, 4),
      from: Currency.eur,
      to: Currency.usd,
      value: 1.05,
    );
    final ExchangeRate exchangeRate2 = ExchangeRate(
      dateTime: DateTime(2023, 9, 3),
      from: Currency.eur,
      to: Currency.usd,
      value: 1.05,
    );
    final ExchangeRate exchangeRate3 = ExchangeRate(
      dateTime: DateTime(2023, 9, 3),
      from: Currency.aud,
      to: Currency.usd,
      value: 1.05,
    );
    final ExchangeRate exchangeRate4 = ExchangeRate(
      dateTime: DateTime(2023, 9, 3),
      from: Currency.aud,
      to: Currency.cad,
      value: 1.05,
    );
    final ExchangeRate exchangeRate5 = ExchangeRate(
      dateTime: DateTime(2023, 9, 3),
      from: Currency.aud,
      to: Currency.cad,
      value: 1,
    );
    test('for the < operator', () {
      expect(
        exchangeRate1 < exchangeRate1,
        isFalse,
        reason: '[exchangeRate1] is exactly the same instance as'
            ' [exchangeRate1]',
      );
      expect(
        exchangeRate1 < exchangeRate2,
        isTrue,
        reason: '[exchangeRate1] was acquired at a more recent date than'
            ' [exchangeRate2]',
      );
      expect(
        exchangeRate3 < exchangeRate2,
        isTrue,
        reason: 'the [from] currency of [exchangeRate3] comes before that of'
            ' [exchangeRate2] in alphabetical order',
      );
      expect(
        exchangeRate4 < exchangeRate3,
        isTrue,
        reason: 'the [to] currency of [exchangeRate4] comes before that of'
            ' [exchangeRate3] in alphabetical order',
      );
      expect(
        exchangeRate5 < exchangeRate4,
        isTrue,
        reason: '[value] of [exchangeRate5] is less than that of'
            ' [exchangeRate4]',
      );
    });
    test('for the <= operator', () {
      expect(
        exchangeRate1 <= exchangeRate1,
        isTrue,
        reason: '[exchangeRate1] is exactly the same instance as'
            ' [exchangeRate1]',
      );
      expect(
        exchangeRate1 <= exchangeRate2,
        isTrue,
        reason: '[exchangeRate1] was acquired at a more recent date than'
            ' [exchangeRate2]',
      );
      expect(
        exchangeRate3 <= exchangeRate2,
        isTrue,
        reason: 'the [from] currency of [exchangeRate3] comes before that of'
            ' [exchangeRate2] in alphabetical order',
      );
      expect(
        exchangeRate4 <= exchangeRate3,
        isTrue,
        reason: 'the [to] currency of [exchangeRate4] comes before that of'
            ' [exchangeRate3] in alphabetical order',
      );
      expect(
        exchangeRate5 <= exchangeRate4,
        isTrue,
        reason: '[value] of [exchangeRate5] is less than that of'
            ' [exchangeRate4]',
      );
    });
    test('for the == operator', () {
      expect(
        exchangeRate1 == exchangeRate1,
        isTrue,
        reason: '[exchangeRate1] is exactly the same instance as'
            ' [exchangeRate1]',
      );
      expect(
        exchangeRate1 == exchangeRate2,
        isFalse,
        reason: '[exchangeRate1] was acquired at a more recent date than'
            ' [exchangeRate2]',
      );
    });
    test('for the >= operator', () {
      expect(
        exchangeRate1 >= exchangeRate1,
        isTrue,
        reason: '[exchangeRate1] is exactly the same instance as'
            ' [exchangeRate1]',
      );
      expect(
        exchangeRate2 >= exchangeRate1,
        isTrue,
        reason: '[exchangeRate1] was acquired at a more recent date than'
            ' [exchangeRate2]',
      );
      expect(
        exchangeRate2 >= exchangeRate3,
        isTrue,
        reason: 'the [from] currency of [exchangeRate3] comes before that of'
            ' [exchangeRate2] in alphabetical order',
      );
      expect(
        exchangeRate3 >= exchangeRate4,
        isTrue,
        reason: 'the [to] currency of [exchangeRate4] comes before that of'
            ' [exchangeRate3] in alphabetical order',
      );
      expect(
        exchangeRate4 >= exchangeRate5,
        isTrue,
        reason: '[value] of [exchangeRate5] is less than that of'
            ' [exchangeRate4]',
      );
    });
    test('for the > operator', () {
      expect(
        exchangeRate1 > exchangeRate1,
        isFalse,
        reason: '[exchangeRate1] is exactly the same instance as'
            ' [exchangeRate1]',
      );
      expect(
        exchangeRate2 > exchangeRate1,
        isTrue,
        reason: '[exchangeRate1] was acquired at a more recent date than'
            ' [exchangeRate2]',
      );
      expect(
        exchangeRate2 > exchangeRate3,
        isTrue,
        reason: 'the [from] currency of [exchangeRate3] comes before that of'
            ' [exchangeRate2] in alphabetical order',
      );
      expect(
        exchangeRate3 > exchangeRate4,
        isTrue,
        reason: 'the [to] currency of [exchangeRate4] comes before that of'
            ' [exchangeRate3] in alphabetical order',
      );
      expect(
        exchangeRate4 > exchangeRate5,
        isTrue,
        reason: '[value] of [exchangeRate5] is less than that of'
            ' [exchangeRate4]',
      );
    });
  });
}
