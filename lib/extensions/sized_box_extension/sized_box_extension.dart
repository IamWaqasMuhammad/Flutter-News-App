import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  /// Creates vertical space
  SizedBox get height => SizedBox(height: toDouble());

  /// Creates horizontal space
  SizedBox get width => SizedBox(width: toDouble());
}
