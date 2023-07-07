part of 'simple_colored_logger.dart';

/// represents a color that can show up in the terminal, and is later used to
/// be converted to ANSI escape code.
///
/// codes and more info about ANSI escape codes, check this stackoverflow thread:
///
enum SimpleColoredLoggerColor {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
}
