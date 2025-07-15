import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  /// Creates vertical space
  SizedBox get ph => SizedBox(height: toDouble());

  /// Creates horizontal space
  SizedBox get pw => SizedBox(width: toDouble());
}
