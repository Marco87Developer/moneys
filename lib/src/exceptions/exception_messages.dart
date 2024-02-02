/// Returns the message string for the [FormatException] that is thrown by the
/// `.parse` constructor of a class or an enum if the input string passed to the
/// constructor is not a valid representation of any possible instance of the
/// class or enum.
///
String parseFormatExceptionMessage(
  final String formattedString,
  final String classOrEnumName,
) =>
    'The “$formattedString” string is not a valid representation of any'
    ' possible $classOrEnumName instance.';
