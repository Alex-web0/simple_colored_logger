import 'package:flutter/foundation.dart';

part 'logger_color.dart';

/// a simple logger to be used, tested on android studio
abstract final class SimpleColoredLogger {
  static const _black = '\x1B[30m';
  static const _red = '\x1B[31m';
  static const _green = '\x1B[32m';
  static const _yellow = '\x1B[33m';
  static const _blue = '\x1B[34m';
  static const _magenta = '\x1B[35m';
  static const _cyan = '\x1B[36m';
  static const _white = '\x1B[37m';
  static const _reset = '\x1B[0m';

  /// whether to log on release or not
  static bool logOnDebugModeOnly = false;

  /// called to initialize public static variables for the logger utility
  /// such as whether to log in release mode or not
  void initialize({
    bool debugModeOnly = false,
  }) {
    logOnDebugModeOnly = debugModeOnly;
  }

  /// creates a log that is with a certain color
  /// the text will be colored and if `tag` is present it works as a prefix for
  /// output log
  /// <br/>
  ///
  /// examples:
  ///
  /// ```
  /// SimpleColoredLogger.log("Hello World", SimpleColoredLoggerColor.red, "[TAG]");
  /// ```
  static void log(String text, SimpleColoredLoggerColor color, [String? tag]) {
    final colorCode = _getColorCode(color);
    final tagString = tag != null ? '$tag ' : '';

    if (logOnDebugModeOnly) {
      if (kDebugMode) return print('$colorCode$tagString$text$_reset');
    } else {
      print('$colorCode$tagString$text$_reset');
    }
  }

  /// creates an error log using [log] function with the error color red
  static void error(String text, [String? tag]) {
    log(text, SimpleColoredLoggerColor.red, tag);
  }

  static void success(String text, [String? tag]) {
    log(text, SimpleColoredLoggerColor.green, tag);
  }

  static void info(String text, [String? tag]) {
    log(text, SimpleColoredLoggerColor.blue, tag);
  }

  static void warning(String text, [String? tag]) {
    log(text, SimpleColoredLoggerColor.yellow, tag);
  }

  static String _getColorCode(SimpleColoredLoggerColor color) {
    switch (color) {
      case SimpleColoredLoggerColor.black:
        return _black;
      case SimpleColoredLoggerColor.red:
        return _red;
      case SimpleColoredLoggerColor.green:
        return _green;
      case SimpleColoredLoggerColor.yellow:
        return _yellow;
      case SimpleColoredLoggerColor.blue:
        return _blue;
      case SimpleColoredLoggerColor.magenta:
        return _magenta;
      case SimpleColoredLoggerColor.cyan:
        return _cyan;
      case SimpleColoredLoggerColor.white:
        return _white;
    }
  }
}
