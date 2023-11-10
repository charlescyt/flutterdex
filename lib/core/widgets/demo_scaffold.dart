import 'package:flutter/material.dart';

import '../../features/flutter_widget/widgets/section.dart';
import '../utils/widget_extension.dart';

class DemoScaffold extends StatelessWidget {
  const DemoScaffold({
    super.key,
    required this.demos,
    this.options,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  final List<Widget> demos;
  final List<Widget>? options;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: demos.separateWith(const SizedBox(height: 4)),
                ),
              ),
            ),
            if (options case final List<Widget> options when options.isNotEmpty)
              OptionsSection(
                children: options.separateWith(const SizedBox(height: 4)),
              ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
