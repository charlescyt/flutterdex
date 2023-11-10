import 'package:flutter/cupertino.dart';

import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class CupertinoPickerDemo extends StatefulWidget {
  const CupertinoPickerDemo({super.key});

  @override
  State<CupertinoPickerDemo> createState() => _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends State<CupertinoPickerDemo> {
  BlendMode _blendMode1 = BlendMode.clear;
  BlendMode _blendMode2 = BlendMode.clear;

  Future<void> _showCupertinoPicker() async {
    return showCupertinoModalPopup<void>(
      context: context,
      useRootNavigator: false,
      builder: (popupContext) {
        return Container(
          height: 300,
          color: CupertinoColors.systemBackground.resolveFrom(popupContext),
          child: CupertinoPicker(
            itemExtent: 32,
            onSelectedItemChanged: (value) {
              setState(() {
                _blendMode1 = BlendMode.values[value];
              });
            },
            children: [
              for (final themeMode in BlendMode.values)
                Center(
                  child: Text(themeMode.name.capitalize),
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showCupertinoPickerBuilder() async {
    return showCupertinoModalPopup<void>(
      context: context,
      useRootNavigator: false,
      builder: (popupConnext) {
        return Container(
          height: 300,
          color: CupertinoColors.systemBackground.resolveFrom(popupConnext),
          child: CupertinoPicker.builder(
            itemExtent: 32,
            childCount: BlendMode.values.length,
            itemBuilder: (_, index) {
              return Center(
                child: Text(BlendMode.values[index].name.capitalize),
              );
            },
            onSelectedItemChanged: (value) {
              setState(() {
                _blendMode2 = BlendMode.values[value];
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'CupertinoPicker',
          child: Column(
            children: [
              Text('Blend Mode: ${_blendMode1.name.capitalize}'),
              const SizedBox(height: 8),
              CupertinoButton.filled(
                onPressed: _showCupertinoPicker,
                child: const Text('Show CupertinoPicker'),
              ),
            ],
          ),
        ),
        Section(
          label: 'CupertinoPicker.builder',
          child: Column(
            children: [
              Text('Blend Mode: ${_blendMode2.name.capitalize}'),
              const SizedBox(height: 8),
              CupertinoButton.filled(
                onPressed: _showCupertinoPickerBuilder,
                child: const Text('Show CupertinoPicker.builder'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
