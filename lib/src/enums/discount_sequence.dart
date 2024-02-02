import 'package:moneys/src/exceptions/exception_messages.dart';

/// A **discount sequence**.
///
/// {@template moneys.discountsequence.whatis}
/// ## What is a discount sequence
///
/// A discount sequence indicates which type of discount should be calculated
/// *first*, the flat discount or the percentage discount.
/// {@endtemplate}
///
enum DiscountSequence implements Comparable<DiscountSequence> {
  /// Flat First
  flatfirst,

  /// Percentage First
  percentagefirst;

  /// Constructs a [DiscountSequence] instance based on [formattedString].
  ///
  /// Throws a [FormatException] if the input string cannot be parsed.
  ///
  /// The accepted inputs are currently:
  ///
  /// * The value of the [name] property of an instance of this enum.
  ///
  /// This includes the output of [toString], which will be parsed back into a
  /// [DiscountSequence] object.
  ///
  /// This constructor is *not case sensitive* and *does not take into account
  /// leading and trailing white spaces*.
  ///
  /// {@macro moneys.discountsequence.whatis}
  ///
  factory DiscountSequence.parse(final String formattedString) {
    final String lowerTrimmed = formattedString.toLowerCase().trim();
    for (final DiscountSequence discountsequence in DiscountSequence.values) {
      if (lowerTrimmed == discountsequence.name) {
        return discountsequence;
      }
    }
    throw FormatException(
      parseFormatExceptionMessage(formattedString, 'DiscountSequence'),
    );
  }

  /// The **order of comparison** of the properties of this enum is:
  ///
  /// 1. [name]
  ///
  @override
  int compareTo(covariant final DiscountSequence other) =>
      name.compareTo(other.name);

  /// Returns a string representation of this instance.
  ///
  /// This string matches the [name] property.
  ///
  /// The returned string can be parsed back using [DiscountSequence.parse].
  ///
  @override
  String toString() => name;
}
