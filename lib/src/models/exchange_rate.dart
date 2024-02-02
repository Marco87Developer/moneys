import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:moneys/src/enums/currency.dart';
import 'package:moneys/src/exceptions/exception_messages.dart';

const String _dateTimeKey = 'dateTime';
const String _fromKey = 'from';
const String _toKey = 'to';
const String _valueKey = 'value';

/// An **exchange rate**.
///
/// {@template moneys.exchangerate.whatis}
/// ## What is an exchange rate
///
/// An exchange rate is the price of one currency in terms of another currency.
/// It is the rate at which one currency can be exchanged for another between
/// nations or economic zones.
///
/// It represents the relative value of one currency in terms of another.
///
/// In practical terms, an exchange rate is a value which, multiplied by the
/// amount of money in [from] currency, gives the equivalent amount of money in
/// [to] currency. In other words, an exchange rate is the value of the amount
/// of money in [from] currency which corresponds to 1 money in [to] currency.
/// {@endtemplate}
///
@immutable
class ExchangeRate implements Comparable<ExchangeRate> {
  /// Constructs an [ExchangeRate] instance.
  ///
  /// {@template moneys.oncecreatednopropertiesmaybechanged}
  /// Once created, no properties may be changed.
  /// {@endtemplate}
  ///
  /// {@macro moneys.exchangerate.whatis}
  ///
  /// ## Example
  ///
  /// If the USD to EUR exchange rate is as follows:
  ///
  /// ```dart
  /// final exchangeRate = ExchangeRate(
  ///   dateTime: DateTime(2024),
  ///   from: Currency.usd,
  ///   to: Currency.eur,
  ///   value: 0.95,
  /// );
  /// ```
  ///
  /// and we want to convert 30 USD to EUR, we will have to multiply 30 by
  /// `exchangeRate.value`. So, based on the `exchangeRate` exchange rate, 30
  /// USD = 30 ⋅ 0.95 EUR = 28.5 EUR.
  ///
  const ExchangeRate({
    required this.dateTime,
    required this.from,
    required this.to,
    required this.value,
  });

  /// Constructs an [ExchangeRate] instance from the [json] string.
  ///
  /// {@macro moneys.oncecreatednopropertiesmaybechanged}
  ///
  /// Throws a [FormatException] if the [json] string is invalid.
  ///
  /// {@macro moneys.exchangerate.whatis}
  ///
  /// ## Example
  ///
  factory ExchangeRate.fromJson(final String json) =>
      ExchangeRate.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [ExchangeRate] instance from [map].
  ///
  /// {@macro moneys.oncecreatednopropertiesmaybechanged}
  ///
  /// Throws a [FormatException] if the [map] is invalid.
  ///
  /// {@macro moneys.exchangerate.whatis}
  ///
  /// ## Example
  ///
  ExchangeRate.fromMap(final Map<String, dynamic> map)
      : dateTime = DateTime.parse(map[_dateTimeKey].toString()),
        from = Currency.parse(map[_fromKey].toString()),
        to = Currency.parse(map[_toKey].toString()),
        value = double.parse(map[_valueKey].toString());

  /// Constructs an [ExchangeRate] instance based on [formattedString].
  ///
  /// {@macro moneys.oncecreatednopropertiesmaybechanged}
  ///
  /// Throws a [FormatException] if the input string cannot be parsed.
  ///
  /// ## Accepted inputs
  ///
  /// The accepted inputs are those that respect the following pattern:
  /// `'<from> <to> <value> <valid ISO 8601 DateTime string>'`.
  ///
  /// This constructor is *not case sensitive* and *does not take into account
  /// leading and trailing white spaces*.
  ///
  /// {@macro moneys.exchangerate.whatis}
  ///
  /// ## Example
  ///
  factory ExchangeRate.parse(final String formattedString) {
    final List<String> strings = formattedString.trim().split(' ');
    try {
      if (strings.length == 4 || strings.length == 5) {
        return ExchangeRate(
          dateTime: strings.length == 4
              ? DateTime.parse(strings[3])
              : DateTime.parse('${strings[3]}T${strings[4]}'),
          from: Currency.parse(strings[0]),
          to: Currency.parse(strings[1]),
          value: double.parse(strings[2]),
        );
      } else {
        throw FormatException(
          parseFormatExceptionMessage(formattedString, 'ExchangeRate'),
        );
      }
    } on Exception {
      throw FormatException(
        parseFormatExceptionMessage(formattedString, 'ExchangeRate'),
      );
    }
  }

  /// The **date and time** when this exchange rate was obtained.
  final DateTime dateTime;

  /// The **starting currency**.
  final Currency from;

  /// The **final currency**.
  final Currency to;

  /// The **numerical value**.
  final double value;

  /// Returns **if this exchange rate can be used to convert a money** of a
  /// certain currency ([from]) into the equivalent money of another currency
  /// ([to]).
  ///
  bool check({
    required final Currency from,
    required final Currency to,
  }) =>
      this.from == from && this.to == to;

  /// Creates a **copy** of this [ExchangeRate] instance but with the **given
  /// fields replaced** with the new values.
  ///
  ExchangeRate copyWith({
    final DateTime? dateTime,
    final Currency? from,
    final Currency? to,
    final double? value,
  }) =>
      ExchangeRate(
        dateTime: dateTime ?? this.dateTime,
        from: from ?? this.from,
        to: to ?? this.to,
        value: value ?? this.value,
      );

  /// Creates a **JSON string representing** this [ExchangeRate] instance.
  ///
  /// The resulting JSON string can be parsed back using
  /// [ExchangeRate.fromJson].
  ///
  String toJson() => json.encode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [ExchangeRate]
  /// instance.
  ///
  /// The resulting map can be parsed back using [ExchangeRate.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _dateTimeKey: dateTime.toIso8601String(),
        _fromKey: from.toString(),
        _toKey: to.toString(),
        _valueKey: value,
      };

  /// Compares this [ExchangeRate] object to [other], returning `0` if the
  /// values are equal.
  ///
  /// The **order of comparison** of the properties of this class is:
  ///
  /// 1. [from] (in alphabetical order)
  /// 1. [to] (in alphabetical order)
  /// 1. [dateTime] (from the most recent to the oldest)
  /// 1. [value] (from least to greatest)
  ///
  @override
  int compareTo(covariant final ExchangeRate other) {
    if (identical(this, other)) {
      return 0;
    }
    // 1º comparison
    final int comparison1 = from.compareTo(other.from);
    if (comparison1 != 0) {
      return comparison1;
    }
    // 2º comparison
    final int comparison2 = to.compareTo(other.to);
    if (comparison2 != 0) {
      return comparison2;
    }
    // 3º comparison
    final int comparison3 = -dateTime.compareTo(other.dateTime);
    if (comparison3 != 0) {
      return comparison3;
    }
    // Last comparison
    final int comparison4 = value.compareTo(other.value);
    return comparison4;
  }

  /// Returns a hash code for this [ExchangeRate] instance.
  ///
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        dateTime,
        from,
        to,
        value,
      ]);

  /// Returns a string representation of this instance.
  ///
  /// The format of the string will be:
  /// `'<from> <to> <value> <ISO 8601 date time string>'`.
  ///
  /// The returned string can be parsed back using [ExchangeRate.parse].
  ///
  @override
  String toString() => '$from $to $value ${dateTime.toIso8601String()}';

  /// If this exchange rate must be ordered before the [other].
  ///
  bool operator <(covariant final ExchangeRate other) => compareTo(other) < 0;

  /// If this exchange rate must be ordered before or equally to the [other].
  ///
  bool operator <=(covariant final ExchangeRate other) => compareTo(other) <= 0;

  /// Test whether this exchange rate is equal to [other].
  ///
  @override
  bool operator ==(covariant final ExchangeRate other) =>
      identical(this, other) || compareTo(other) == 0;

  /// If this exchange rate must be ordered after or equally to the [other].
  ///
  bool operator >=(covariant final ExchangeRate other) => compareTo(other) >= 0;

  /// If this exchange rate must be ordered after the [other].
  ///
  bool operator >(covariant final ExchangeRate other) => compareTo(other) > 0;
}
