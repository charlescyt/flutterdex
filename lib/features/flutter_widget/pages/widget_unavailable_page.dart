import 'package:flutter/material.dart';

import '../../../core/widgets/top_app_bar.dart';

class WidgetUnavailablePage extends StatelessWidget {
  const WidgetUnavailablePage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopAppBar(
            title: Text('Widget Unavailable'),
          ),
          Expanded(
            child: Center(
              child: Text('Widget with id "$id" is not available.'),
            ),
          ),
        ],
      ),
    );
  }
}
