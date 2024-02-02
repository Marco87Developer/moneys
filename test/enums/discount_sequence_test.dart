import 'package:moneys/src/enums/discount_sequence.dart';
import 'package:test/test.dart';

void main() {
  group('the transitive and symmetric properties:', () {
    test('the transitive property: if [b] = [a] and [c] = [b], then [c] = [a]',
        () {
      for (final DiscountSequence sequence in DiscountSequence.values) {
        final DiscountSequence a = sequence;
        final DiscountSequence b = a;
        final DiscountSequence c = b;
        expect(c, a);
      }
    });
    test('the symmetric property: if [a] = [b], then [b] = [a]', () {
      for (final DiscountSequence sequence in DiscountSequence.values) {
        final DiscountSequence a = sequence;
        final DiscountSequence b = sequence;
        expect(a, b);
        expect(b, a);
      }
    });
  });

  group('factory DiscountSequence.parse:', () {
    test('with a valid string: [name]', () {
      expect(
        DiscountSequence.parse('flatfirst'),
        DiscountSequence.flatfirst,
        reason: 'coincides with the [name] property',
      );
      expect(
        DiscountSequence.parse(' PERCENTAGEFIRST '),
        DiscountSequence.percentagefirst,
        reason: 'coincides with the [name] property, except for capitalization'
            ' and leading and trailing whitespace',
      );
    });
    test('with all possible values', () {
      for (final DiscountSequence sequence in DiscountSequence.values) {
        expect(DiscountSequence.parse(sequence.name), sequence);
        expect(DiscountSequence.parse(sequence.toString()), sequence);
      }
    });
    test('with an invalid string', () {
      expect(
        () => DiscountSequence.parse('invalid string'),
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
                contains('DiscountSequence'),
              ),
        ),
        reason: 'does not coincide with the [name] property',
      );
    });
  });

  group('@override int compareTo', () {
    test('with different values', () {
      expect(
        DiscountSequence.flatfirst.compareTo(DiscountSequence.percentagefirst),
        isNegative,
        reason: '“flatfirst” comes before “percentagefirst” in alphabetical'
            ' order',
      );
      expect(
        DiscountSequence.flatfirst.compareTo(DiscountSequence.flatfirst),
        isZero,
        reason: '“flatfirst” and “flatfirst” are the same word',
      );
      expect(
        DiscountSequence.percentagefirst.compareTo(DiscountSequence.flatfirst),
        isPositive,
        reason: '“percentagefirst” comes after “flatfirst” in alphabetical'
            ' order',
      );
    });
  });

  group('@override String toString:', () {
    test('conversion to string', () {
      expect(
        DiscountSequence.flatfirst.toString(),
        'flatfirst',
        reason: 'the the [name] property of DiscountSequence.flatfirst is'
            ' “flatfirst”',
      );
    });
    test('must match [name]', () {
      for (final DiscountSequence discountsequence in DiscountSequence.values) {
        expect(
          discountsequence.toString(),
          discountsequence.name,
        );
      }
    });
    test(
        'the resulting string can be parsed back using [DiscountSequence.parse]'
        ' in all cases', () {
      for (final DiscountSequence discountsequence in DiscountSequence.values) {
        expect(
          DiscountSequence.parse(discountsequence.toString()),
          discountsequence,
          reason: 'the resulting string of [discountsequence] can be parsed'
              ' back to the corresponding [DiscountSequence] value',
        );
      }
    });
  });
}
