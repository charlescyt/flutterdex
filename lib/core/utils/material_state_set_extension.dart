import 'package:flutter/material.dart' show MaterialState;

extension MaterialStateSetExtension on Set<MaterialState> {
  bool get isSelected => contains(MaterialState.selected);
}
