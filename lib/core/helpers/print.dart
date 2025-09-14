import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

abstract final class Print {
  static void log(
    final Object? object, {
    final String? tag,
    final StackTrace? st,
  }) {
    if (kDebugMode) {
      developer.log('$object', name: tag ?? 'log', stackTrace: st);
    }
  }

  static void info(
    final Object? object, {
    final String? tag,
    final StackTrace? st,
  }) {
    log('\u001b[32m 🍀 $object', tag: tag ?? 'info', st: st);
  }

  static void warning(
    final Object? object, {
    final String? tag,
    final StackTrace? st,
  }) {
    log('\u001B[34m 🔥 $object', tag: tag ?? 'warning', st: st);
  }

  static void error(
    final Object? object, {
    final String? tag,
    final StackTrace? st,
  }) {
    log('\u001b[31m 💀 $object', tag: tag ?? 'error', st: st);
  }

  static void json(
    final Object? object, {
    final String? tag,
    final StackTrace? st,
  }) {
    final data = JsonEncoder.withIndent(' ' * 2).convert(object);
    log(data, tag: tag ?? 'json', st: st);
  }
}
