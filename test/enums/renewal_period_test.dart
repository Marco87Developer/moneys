import 'package:moneys/src/enums/renewal_period.dart';
import 'package:test/test.dart';

void main() {
  group('the transitive and symmetric properties:', () {
    test('the transitive property: if [b] = [a] and [c] = [b], then [c] = [a]',
        () {
      for (final RenewalPeriod renewalperiod in RenewalPeriod.values) {
        final RenewalPeriod a = renewalperiod;
        final RenewalPeriod b = a;
        final RenewalPeriod c = b;
        expect(c, a);
      }
    });
    test('the symmetric property: if [a] = [b], then [b] = [a]', () {
      for (final RenewalPeriod renewalperiod in RenewalPeriod.values) {
        final RenewalPeriod a = renewalperiod;
        final RenewalPeriod b = renewalperiod;
        expect(a, b);
        expect(b, a);
      }
    });
  });

  group('uniqueness', () {
    test('all renewal periods should have a unique [duration] property', () {
      final Set<Duration> durations = Set.from(
        RenewalPeriod.values
            .map((final renewalperiod) => renewalperiod.duration),
      );
      expect(
        durations.length,
        RenewalPeriod.values.length,
      );
    });
  });

  group('factory RenewalPeriod.parse', () {
    test('with a valid string: [name]', () {
      expect(
        RenewalPeriod.parse('annual'),
        RenewalPeriod.annual,
        reason: 'coincides with the [name]',
      );
    });
    test('with a valid string: [name] (with leading and trailing white spaces)',
        () {
      expect(
        RenewalPeriod.parse(' MONTHLY '),
        RenewalPeriod.monthly,
        reason: 'coincides with the [name] apart from the leading and trailing'
            ' white spaces',
      );
    });
    test('with all possible values', () {
      for (final RenewalPeriod renewalperiod in RenewalPeriod.values) {
        expect(RenewalPeriod.parse(renewalperiod.name), renewalperiod);
        expect(RenewalPeriod.parse(renewalperiod.toString()), renewalperiod);
      }
    });
    test('with an invalid string', () {
      expect(
        () => RenewalPeriod.parse('invalid string'),
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
                contains('RenewalPeriod'),
              ),
        ),
        reason: 'does not coincide with any of the [name] property',
      );
    });
  });

  group('@override int compareTo', () {
    test('with different values', () {
      expect(
        RenewalPeriod.quarterly.compareTo(RenewalPeriod.annual),
        isNegative,
        reason: '3 months last less than a year',
      );
      expect(
        RenewalPeriod.weekly.compareTo(RenewalPeriod.monthly),
        isNegative,
        reason: 'a week lasts less than a month',
      );
      expect(
        RenewalPeriod.daily.compareTo(RenewalPeriod.daily),
        isZero,
        reason: 'one day has the same duration as another day',
      );
      expect(
        RenewalPeriod.sixmonth.compareTo(RenewalPeriod.quarterly),
        isPositive,
        reason: '6 months last longer than 3 months',
      );
    });
  });

  group('@override String toString:', () {
    test('conversion to string', () {
      expect(
        RenewalPeriod.annual.toString(),
        'annual',
        reason: 'the [name] property is “annual”',
      );
    });
    test('must match [name]', () {
      for (final RenewalPeriod renewalperiod in RenewalPeriod.values) {
        expect(renewalperiod.toString(), renewalperiod.name);
      }
    });
    test(
        'the resulting string can be parsed back using [RenewalPeriod.parse] in'
        ' all cases', () {
      for (final RenewalPeriod renewalperiod in RenewalPeriod.values) {
        expect(
          RenewalPeriod.parse(renewalperiod.toString()),
          renewalperiod,
          reason: 'the resulting string of [renewalperiod] can be parsed back'
              ' to the corresponding [RenewalPeriod] value',
        );
      }
    });
  });
}
