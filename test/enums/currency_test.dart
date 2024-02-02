import 'dart:collection';

import 'package:geos/geos.dart';
import 'package:moneys/src/enums/currency.dart';
import 'package:test/test.dart';

void main() {
  group('the transitive and symmetric properties:', () {
    test('the transitive property: if [b] = [a] and [c] = [b], then [c] = [a]',
        () {
      for (final Currency currency in Currency.values) {
        final Currency a = currency;
        final Currency b = a;
        final Currency c = b;
        expect(c, a);
      }
    });
    test('the symmetric property: if [a] = [b], then [b] = [a]', () {
      for (final Currency currency in Currency.values) {
        final Currency a = currency;
        final Currency b = currency;
        expect(a, b);
        expect(b, a);
      }
    });
  });

  group('uniqueness:', () {
    test('all currencies should have a unique [alphabeticCode] property', () {
      final Set<String> alphabeticCodes = Set.from(
        Currency.values.map((final currency) => currency.alphabeticCode),
      );
      expect(
        alphabeticCodes.length,
        Currency.values.length,
      );
    });
    test('all currencies should have a unique [name] property', () {
      final Set<String> names =
          Set.from(Currency.values.map((final currency) => currency.name));
      expect(
        names.length,
        Currency.values.length,
      );
    });
    test('all currencies should have a unique [numericCode] property', () {
      final Set<String> numericCodes = Set.from(
        Currency.values.map((final currency) => currency.numericCode),
      );
      expect(
        numericCodes.length,
        Currency.values.length,
      );
    });
  });

  group('factory Currency.parse:', () {
    test('with a valid string: [alphabeticCode]', () {
      expect(
        Currency.parse('EUR'),
        Currency.eur,
        reason: 'coincides with the [alphabeticCode]',
      );
    });
    test(
        'with a valid string: [alphabeticCode] (with leading and trailing white'
        ' spaces)', () {
      expect(
        Currency.parse(' EUR '),
        Currency.eur,
        reason: 'coincides with the [alphabeticCode] apart from the leading and'
            ' trailing white spaces',
      );
    });
    test('with a valid string: [name]', () {
      expect(
        Currency.parse('eur'),
        Currency.eur,
        reason: 'coincides with the [name]',
      );
    });
    test('with a valid string: [name] (with leading and trailing white spaces)',
        () {
      expect(
        Currency.parse(' EUR '),
        Currency.eur,
        reason: 'coincides with the [name] apart from the leading and trailing'
            ' white spaces',
      );
    });
    test('with a valid string: [numericCode]', () {
      expect(
        Currency.parse('978'),
        Currency.eur,
        reason: 'coincides with the [numericCode]',
      );
    });
    test(
        'with a valid string: [numericCode] (with leading and trailing white'
        ' spaces)', () {
      expect(
        Currency.parse(' 978 '),
        Currency.eur,
        reason: 'coincides with the [numericCode] apart from the leading and'
            ' trailing white spaces',
      );
    });
    test('with all possible values', () {
      for (final Currency currency in Currency.values) {
        expect(Currency.parse(currency.alphabeticCode), currency);
        expect(Currency.parse(' ${currency.alphabeticCode} '), currency);
        expect(Currency.parse(currency.name), currency);
        expect(Currency.parse(' ${currency.name} '), currency);
        expect(Currency.parse(currency.numericCode), currency);
        expect(Currency.parse(' ${currency.numericCode} '), currency);
        expect(Currency.parse(currency.toString()), currency);
      }
    });
    test('with an invalid string', () {
      expect(
        () => Currency.parse('invalid string'),
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
                contains('Currency'),
              ),
        ),
        reason: 'does not coincide with any of the following properties:'
            ' [alphabeticCode], [name] or [numericCode]',
      );
    });
  });

  group('[alphabeticCode]:', () {
    test('with different values', () {
      expect(
        Currency.eur.alphabeticCode,
        'EUR',
        reason: 'the [alphabeticCode] of the euro is EUR',
      );
      expect(
        Currency.try_.alphabeticCode,
        'TRY',
        reason: 'the [alphabeticCode] of the turkish lira is TRY',
      );
    });
  });

  group('[countries]:', () {
    test('with different values', () {
      expect(
        Currency.eur.countries,
        SplayTreeSet<Country>.from(<Country>[
          Country.alandIslands,
          Country.andorra,
          Country.austria,
          Country.belgium,
          Country.croatia,
          Country.cyprus,
          Country.estonia,
          Country.finland,
          Country.france,
          Country.frenchGuiana,
          Country.frenchSouthernTerritories,
          Country.germany,
          Country.greece,
          Country.guadeloupe,
          Country.holySee,
          Country.ireland,
          Country.italy,
          Country.latvia,
          Country.lithuania,
          Country.luxembourg,
          Country.malta,
          Country.martinique,
          Country.mayotte,
          Country.monaco,
          Country.montenegro,
          Country.netherlands,
          Country.portugal,
          Country.reunion,
          Country.saintBarthelemy,
          Country.saintMartinFrenchPart,
          Country.saintPierreAndMiquelon,
          Country.sanMarino,
          Country.slovakia,
          Country.slovenia,
          Country.spain,
        ]),
        reason: 'the countries that use the euro are: Åland Islands, Andorra,'
            ' Austria, Belgium, Croatia, Cyprus, Estonia, Finland, France,'
            ' French Guiana, French Southern Territories (The), Germany,'
            ' Greece, Guadeloupe, Holy See (The), Ireland, Italy, Latvia,'
            ' Lithuania, Luxembourg, Malta, Martinique, Mayotte, Monaco,'
            ' Montenegro, Netherlands (The), Portugal, Réunion,'
            ' Saint Barthélemy, Saint Martin (French Part), Saint Pierre And '
            'Miquelon, San Marino, Slovakia, Slovenia and Spain',
      );
      expect(
        Currency.pgk.countries,
        SplayTreeSet<Country>.from(<Country>[Country.papuaNewGuinea]),
        reason: 'the country that uses Kina is Papua New Guinea',
      );
    });
  });

  group('[currency]:', () {
    test('with different values', () {
      expect(
        Currency.eur.currency,
        'Euro',
        reason:
            'the name of the currency represented by Currency.eur is “Euro”',
      );
      expect(
        Currency.usd.currency,
        'US Dollar',
        reason: 'the name of the currency represented by Currency.usd is “US'
            ' Dollar”',
      );
    });
  });

  group('[entities]:', () {
    test('with different values', () {
      expect(
        Currency.eur.entities,
        SplayTreeSet<String>.from(<String>[
          'Åland Islands',
          'Andorra',
          'Austria',
          'Belgium',
          'Croatia',
          'Cyprus',
          'Estonia',
          'European Union',
          'Finland',
          'France',
          'French Guiana',
          'French Southern Territories (The)',
          'Germany',
          'Greece',
          'Guadeloupe',
          'Holy See (The)',
          'Ireland',
          'Italy',
          'Latvia',
          'Lithuania',
          'Luxembourg',
          'Malta',
          'Martinique',
          'Mayotte',
          'Monaco',
          'Montenegro',
          'Netherlands (The)',
          'Portugal',
          'Réunion',
          'Saint Barthélemy',
          'Saint Martin (French Part)',
          'Saint Pierre And Miquelon',
          'San Marino',
          'Slovakia',
          'Slovenia',
          'Spain',
        ]),
        reason: 'the entities that use the euro are: Åland Islands, Andorra,'
            ' Austria, Belgium, Croatia, Cyprus, Estonia, Finland, France,'
            ' French Guiana, French Southern Territories (The), Germany,'
            ' Greece, Guadeloupe, Holy See (The), Ireland, Italy, Latvia,'
            ' Lithuania, Luxembourg, Malta, Martinique, Mayotte, Monaco,'
            ' Montenegro, Netherlands (The), Portugal, Réunion,'
            ' Saint Barthélemy, Saint Martin (French Part), Saint Pierre And '
            'Miquelon, San Marino, Slovakia, Slovenia and Spain',
      );
      expect(
        Currency.pgk.entities,
        SplayTreeSet<String>.from(<String>['Papua New Guinea']),
        reason: 'the entity that uses Kina is Papua New Guinea',
      );
    });
  });

  group('[fundDefinition]:', () {
    test('with different values', () {
      expect(
        Currency.usn.fundDefinition,
        '“Next day” funds are immediately available for transfer in like funds,'
        ' and, subject to settlement, available the next business day for same'
        ' day funds transfer or withdrawal in cash.',
        reason: 'Currency.usn is a fund',
      );
      expect(
        Currency.eur.fundDefinition,
        isNull,
        reason: 'Currency.eur is not a fund',
      );
    });
  });

  group('[isFund]:', () {
    test('with different values', () {
      expect(
        Currency.usn.isFund,
        isTrue,
        reason: 'Currency.usn is a fund',
      );
      expect(
        Currency.eur.isFund,
        isFalse,
        reason: 'Currency.eur is not a fund',
      );
    });
  });

  group('[isPreciousMetal]:', () {
    test('with different values', () {
      expect(
        Currency.xag.isPreciousMetal,
        isTrue,
        reason: 'Currency.xag is a precious metal',
      );
      expect(
        Currency.eur.isPreciousMetal,
        isFalse,
        reason: 'Currency.eur is not a precious metal',
      );
    });
  });

  group('[minorUnit]:', () {
    test('with different values', () {
      expect(
        Currency.eur.minorUnit,
        2,
        reason: '[minorUnit] of Currency.eur is 2',
      );
      expect(
        Currency.uyw.minorUnit,
        4,
        reason: '[minorUnit] of Currency.uyw is 4',
      );
    });
  });

  group('[numericCode]:', () {
    test('with different values', () {
      expect(
        Currency.eur.numericCode,
        '978',
        reason: '[numericCode] of Currency.eur is “978”',
      );
      expect(
        Currency.usd.numericCode,
        '840',
        reason: '[numericCode] of Currency.usd is “840”',
      );
    });
  });

  group('[symbol]:', () {
    test('with different values', () {
      expect(
        Currency.eur.symbol,
        '€',
        reason: '[symbol] of Currency.eur is “€”',
      );
      expect(
        Currency.usd.symbol,
        r'$',
        reason: r'[symbol] of Currency.usd is “$”',
      );
    });
  });

  group('@override int compareTo', () {
    test('with different values', () {
      expect(
        Currency.eur.compareTo(Currency.fjd),
        isNegative,
        reason: 'EUR comes before FJD in alphabetical order',
      );
      expect(
        Currency.eur.compareTo(Currency.try_),
        isNegative,
        reason: 'EUR comes before TRY in alphabetical order',
      );
      expect(
        Currency.eur.compareTo(Currency.eur),
        isZero,
        reason: 'EUR and EUR are the same word',
      );
      expect(
        Currency.eur.compareTo(Currency.aoa),
        isPositive,
        reason: 'EUR comes after AOA in alphabetical order',
      );
    });
  });

  group('@override String toString:', () {
    test('conversion to string', () {
      expect(
        Currency.eur.toString(),
        'eur',
        reason: 'the lowercase [alphabeticCode] of the euro is “eur”',
      );
    });
    test('must match [alphabeticCode], but with lowercase letters', () {
      for (final Currency currency in Currency.values) {
        expect(currency.toString(), currency.alphabeticCode.toLowerCase());
      }
    });
    test(
        'the resulting string can be parsed back using [Currency.parse] in all'
        ' cases', () {
      for (final Currency currency in Currency.values) {
        expect(
          Currency.parse(currency.toString()),
          currency,
          reason: 'the resulting string of [currency] can be parsed back to the'
              ' corresponding [Currency] value',
        );
      }
    });
  });
}
