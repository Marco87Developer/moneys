import 'package:moneys/src/exceptions/exception_messages.dart';

/// A **money transaction method**.
///
/// {@template moneys.moneytransactionmethod.whatis}
/// ## What is a money transaction method
///
/// A money transaction method is the method used to make a money transaction.
/// {@endtemplate}
///
enum MoneyTransactionMethod implements Comparable<MoneyTransactionMethod> {
  /// Bank Draft
  bankdraft(
    englishName: 'Bank Draft',
  ),

  /// Bank Transfer
  banktransfer(
    englishName: 'Bank Transfer',
  ),

  /// Bill Pay
  billpay(
    englishName: 'Bill Pay',
  ),

  /// Cash
  cash(
    englishName: 'Cash',
  ),

  /// Check
  check(
    englishName: 'Check',
  ),

  /// Credit Card
  creditcard(
    englishName: 'Credit Card',
  ),

  /// Cryptocurrency
  cryptocurrency(
    englishName: 'Cryptocurrency',
  ),

  /// Debit Card
  debitcard(
    englishName: 'Debit Card',
  ),

  /// Digital Currency
  digitalcurrency(
    englishName: 'Digital Currency',
  ),

  /// Digital Wallet
  digitalwallet(
    englishName: 'Digital Wallet',
  ),

  /// Direct Deposit
  directdeposit(
    englishName: 'Direct Deposit',
  ),

  /// E-Check
  echeck(
    englishName: 'E-Check',
  ),

  /// Escrow Service
  escrowservice(
    englishName: 'Escrow Service',
  ),

  /// Gift Card
  giftcard(
    englishName: 'Gift Card',
  ),

  /// Mobile Payment
  mobilepayment(
    englishName: 'Mobile Payment',
  ),

  /// Money Order
  moneyorder(
    englishName: 'Money Order',
  ),

  /// Pay Roll Card
  payrollcard(
    englishName: 'Pay Roll Card',
  ),

  /// Peer-To-Peer
  peertopeer(
    englishName: 'Peer-To-Peer',
  ),

  /// Prepaid Card
  prepaidcard(
    englishName: 'Prepaid Card',
  ),

  /// Standing Order
  standingorder(
    englishName: 'Standing Order',
  ),

  /// Wire Transfer
  wiretransfer(
    englishName: 'Wire Transfer',
  );

  /// Constructs a [MoneyTransactionMethod] instance.
  ///
  /// For example, to create a `MoneyTransactionMethod` object representing the
  /// bank transfer method:
  ///
  /// ```dart
  /// final bankTransfer = const MoneyTransactionMethod.banktransfer;
  /// ```
  ///
  /// {@macro moneys.moneytransactionmethod.whatis}
  ///
  const MoneyTransactionMethod({
    required this.englishName,
  });

  /// Constructs a [MoneyTransactionMethod] instance based on [formattedString].
  ///
  /// Throws a [FormatException] if the input string cannot be parsed.
  ///
  /// The accepted inputs are currently:
  ///
  /// * The value of the [name] property of an instance of this enum.
  /// * The value of the [englishName] property of an instance of this enum.
  ///
  /// This includes the output of [toString], which will be parsed back into a
  /// [MoneyTransactionMethod] object.
  ///
  /// This constructor is *not case sensitive* and *does not take into account
  /// leading and trailing white spaces*.
  ///
  /// {@macro moneys.moneytransactionmethod.whatis}
  ///
  factory MoneyTransactionMethod.parse(final String formattedString) {
    final String lowerTrimmed = formattedString.toLowerCase().trim();
    for (final MoneyTransactionMethod method in MoneyTransactionMethod.values) {
      if (lowerTrimmed == method.name ||
          lowerTrimmed == method.englishName.toLowerCase().trim()) {
        return method;
      }
    }
    throw FormatException(
      parseFormatExceptionMessage(formattedString, 'MoneyTransactionMethod'),
    );
  }

  /// The English name.
  final String englishName;

  /// The **order of comparison** of the properties of this enum is:
  ///
  /// 1. [name]
  ///
  @override
  int compareTo(covariant final MoneyTransactionMethod other) =>
      name.compareTo(other.name);

  /// Returns a string representation of this instance.
  ///
  /// This string matches the [name] property.
  ///
  /// The returned string can be parsed back using
  /// [MoneyTransactionMethod.parse].
  ///
  @override
  String toString() => name;
}
