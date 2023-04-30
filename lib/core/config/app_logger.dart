// ignore_for_file: always_declare_return_types, constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  final Logger _logger = Logger();

  factory AppLogger() {
    return AppLogger._internal();
  }

  AppLogger._internal();
  static const JsonEncoder _jsonEncoder = JsonEncoder.withIndent(" ");

  debugPrintLog({String tag = '!@#', String message = ''}) async {
    if (!kReleaseMode) {
      debugPrint('$tag: $message');
    }
  }

  printLog(
      {String tag = '!@#',
      String? message = '',
      AppLoggerConstants state = AppLoggerConstants.DEBUG}) {
    if (!kReleaseMode) {
      switch (state) {
        case AppLoggerConstants.INFO:
          _logger.i('$tag: $message');
          break;
        case AppLoggerConstants.DEBUG:
          _logger.d('$tag: $message');
          break;
        case AppLoggerConstants.ERROR:
          _logger.e('$tag: $message');
          break;
        case AppLoggerConstants.WARNING:
          _logger.w('$tag: $message');
          break;
      }
    }
  }

  String? prettyString(String? jsonString) {
    if (jsonString == null) {
      return null;
    }
    try {
      return _jsonEncoder.convert(json.decode(jsonString));
    } catch (e) {
      return "Unable to parse\n $e";
    }
  }

  printLogger({String tag = '!@#', String message = '', bool isJson = false}) {
    if (!kReleaseMode) {
      isJson
          ? printPrettyJsonString(tag: tag, jsonString: message)
          : _logger.d('$tag: $message');
    }
  }

  void printPrettyJsonString({String? jsonString, String tag = '!@#'}) {
    _logger.d('$tag\n${prettyString(jsonString)}');
  }
}

enum AppLoggerConstants { INFO, WARNING, ERROR, DEBUG }
