import 'package:moneys/src/exceptions/exception_messages.dart';

/// A **renewal period**.
///
/// {@template moneys.renewalperiod.whatis}
/// ## What is a renewal period
///
/// A renewal period indicates *a period of time that recurs cyclically*, after
/// which the initial conditions are restored.
///
/// For example, in the case of a budget, renewal indicates the period of time
/// after which the amount of the budget is reset, or renewed.
/// {@endtemplate}
///
enum RenewalPeriod implements Comparable<RenewalPeriod> {
  /// Annual
  annual(
    duration: Duration(days: 365, hours: 6),
  ),

  /// Daily
  daily(
    duration: Duration(days: 1),
  ),

  /// Monthly
  monthly(
    duration: Duration(days: 30, hours: 10, minutes: 30),
  ),

  /// Quarterly
  quarterly(
    duration: Duration(days: 91, hours: 7, minutes: 30),
  ),

  /// Six-month
  sixmonth(
    duration: Duration(days: 182, hours: 15),
  ),

  /// Weekly
  weekly(
    duration: Duration(days: 7),
  );

  /// Constructs a [RenewalPeriod] instance.
  ///
  /// For example, to create a `RenewalPeriod` object representing the weekly
  /// renewal period:
  ///
  /// ```dart
  /// final weeklyRenewalPeriod = const RenewalPeriod.weekly;
  /// ```
  ///
  /// {@macro moneys.renewalperiod.whatis}
  ///
  const RenewalPeriod({
    required this.duration,
  });

  /// Constructs a [RenewalPeriod] instance based on [formattedString].
  ///
  /// Throws a [FormatException] if the input string cannot be parsed.
  ///
  /// The accepted inputs are currently:
  ///
  /// * The value of the [name] property of an instance of this enum.
  ///
  /// This includes the output of [toString], which will be parsed back into a
  /// [RenewalPeriod] object.
  ///
  /// This constructor is *not case sensitive* and *does not take into account
  /// leading and trailing white spaces*.
  ///
  /// {@macro moneys.renewalperiod.whatis}
  ///
  factory RenewalPeriod.parse(final String formattedString) {
    final String lowerTrimmed = formattedString.toLowerCase().trim();
    for (final RenewalPeriod renewalperiod in RenewalPeriod.values) {
      if (lowerTrimmed == renewalperiod.name) {
        return renewalperiod;
      }
    }
    throw FormatException(
      parseFormatExceptionMessage(formattedString, 'RenewalPeriod'),
    );
  }

  /// The **duration**.
  final Duration duration;

  /// The **order of comparison** of the properties of this enum is:
  ///
  /// 1. [duration]
  ///
  @override
  int compareTo(covariant final RenewalPeriod other) =>
      duration.compareTo(other.duration);

  /// Returns a string representation of this instance.
  ///
  /// This string matches the [name] property.
  ///
  /// The returned string can be parsed back using [RenewalPeriod.parse].
  ///
  @override
  String toString() => name;
}
