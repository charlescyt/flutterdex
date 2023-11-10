import 'package:flutter/widgets.dart';

extension WidgetListExtension on List<Widget> {
  List<Widget> separateWith(Widget separator) => [
        if (this case [...final widgets, final lastWidget]) ...[
          for (final widget in widgets) ...[
            widget,
            separator,
          ],
          lastWidget,
        ],
      ];
}
