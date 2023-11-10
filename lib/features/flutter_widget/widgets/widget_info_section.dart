import 'package:flutter/material.dart';

import '../../../core/utils/widget_extension.dart';
import '../../../core/widgets/code_block.dart';
import '../models/flutter_widget.dart';
import 'section.dart';
import 'widget_category_chip.dart';
import 'widget_reference_chip.dart';
import 'widget_type_chip.dart';

class WidgetInfoSection extends StatelessWidget {
  const WidgetInfoSection({
    super.key,
    required this.flutterWidget,
    this.padding,
  });

  final FlutterWidget flutterWidget;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      child: Column(
        children: [
          Section(
            label: 'Category & Type',
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                WidgetCategoryChip(flutterWidget.category),
                const SizedBox(width: 8),
                WidgetTypeChip(flutterWidget.type),
              ],
            ),
          ),
          Section(
            label: 'Description',
            child: Text(flutterWidget.description),
          ),
          if (flutterWidget.related.isNotEmpty)
            Section(
              label: 'Related',
              child: Wrap(
                spacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  for (final reference in flutterWidget.related) //
                    WidgetReferenceChip(reference),
                ],
              ),
            ),
          Section(
            label: 'Constructor',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final constructor in flutterWidget.availableConstructors)
                  CodeBlock(
                    code: constructor.formattedCode,
                    showCopyButton: false,
                  ),
              ].separateWith(const SizedBox(height: 8)),
            ),
          ),
        ],
      ),
    );
  }
}
