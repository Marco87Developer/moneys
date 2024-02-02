import 'package:meta/meta.dart';

/// Exception thrown when the **wrong exchange rate** is used.
///
/// This can happen, for example, if you use the following exchange rate:
///
/// ```dart
/// ExchangeRate(
///   dateTime: DateTime(2021, 8, 27),
///   from: Currency.aud,
///   to: Currency.usd,
///   value: 0.85,
/// );
/// ```
///
/// to convert a money in USD to a money in EUR.
///
@immutable
class InvalidExchangeRateException implements Exception {
  /// Constructs an [InvalidExchangeRateException] instance with an optional
  /// error [message].
  ///
  const InvalidExchangeRateException([
    this.message = '',
  ]);

  /// A **message** describing the error.
  final String message;

  /// Returns a description of this exception, which coincides with the
  /// [message].
  ///
  @override
  String toString() => message;
}
