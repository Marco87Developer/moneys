![Pub Version](https://img.shields.io/pub/v/moneys?include_prereleases)
![GitHub Top Language](https://img.shields.io/github/languages/top/Marco87Developer/moneys)

# Moneys

A set of classes and enumerations for managing money and transactions.

## `Money` class

`Money` class is one of the pillars of this package. It has 2 properties: the `amount` and the `currency` (see the section about it).

In order to save data in a database, has the `toMap()` method, and to retrieve data from the database, has the  `fromMap(Map<String, dynamic> map)` method.

This class allows the display of the value of money in a localized way. In addition, it allows viewing it with the “k” representation (for example, ‘10,000 USD’ will be write as ‘10k USD’).

So, to give an example, a `Money` can look like this:
```dart
Money(
    amount: 1000.15,
    currency: Currency.eur,
)
```

Also, `convert()` method allows to convert a money of a currency into a money of another one.

## `Currency` enumeration

In this enumeration are enumerated all the currencies of the world, according to [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html). For each currency, it make available some properties:

* `alphabetic`. This is the alphabetic representation of the currency (for example, for the US dollar it will be “USD”, always in uppercase).
* `emojiFlag`. This is the corresponding emoji flag to the currency.
* `exponent`. This is the number of decimal digits that the currency’s representation requires. In the case that it does not apply, it returns `null`.
* `isFund`. This indicates with a `bool` if the currency refers to a fund.
* `name`. This is the complete name of the currency.
* `numeric`. This is the numeric representation of the currency. These numbers have 3 digits.
* `symbol`. This is symbol used for the currency.

Thanks to the `StringToCurrencyX` extension (`on String`) makes available the `toCurrency()` method, which allows to determine the `Currency` value from a string.

## `ExchangeRate` class

This class stores the rate value in order to convert a money of a currency into a money of another one.

## `MoneyTransaction` class

The `MoneyTransaction` class records the date, the value, and the transaction method used. It also has a *required* parameter for transaction identification: `id`. You should guarantee its uniqueness.

`MoneyTransaction` is characterized according to whether it is income or expense (`ExpenseOrIncome` enumeration is used). The method used is specified by the value of the `MoneyTransactionMethod` enumeration. The frequency of renewal of a transaction is specified by the value of the `Renewal` enumeration.

## `Product` class

This class models a product. Describes the product with the following properties: the `brand`, the `category`, the `cost`, the `description`, the `id`, the `name`, the `origin` and the `price`.

### `List<MoneyTransaction>` extension methods

These methods make it easy to manage the history of the transactions. These methods provide these features:

* Get the entire history of transactions.
* Add one transaction to the history.
* Remove a transaction from the history.
* Get all the transactions (expenses, incomes, or both) made at any given time.
* Get all the transactions (expenses, incomes, or both) made at any given time or before.
* Get all the transactions (expenses, incomes, or both) made at any given time or after.
* Get all the transactions (expenses, incomes, or both) made using a certain transaction method.
* Get all the transactions in the history with value _less_ than (or _less_ than or _equal_ to) a given value.
* Get all the transactions in the history with value _greater_ than (or _greater_ than or _equal_ to) a given value.

## `Budget` class

Use the `Budget` class to manage a budget. Give it a `name`, specify how large it is (`size`), indicate what the `renewal` period is and from what date (`start`), and manage the `List<MoneyTransaction>` list of the transactions linked with this budget.

Also, this class, has the following methods:

* `daysBetweenRenewals()`. Returns the numbers of days that there are between the last renewal and the next one, with respect to `from` date and time.
* `lastRenewal()`. Returns the last renewal starting from `from` date.
* `nextRenewal()`. Returns the next renewal starting from `from` date.
* `earned()`. Returns the total of the incomes. These can be filtered with respect to `from` and `until` dates.
* `spent()`. Returns the total of the expenses. These can be filtered with respect to `from` and `until` dates.
