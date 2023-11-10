import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  Future<void> _showHero({required BuildContext context}) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (routeContext) {
          return SizedBox.expand(
            child: Material(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Hero(
                    tag: 'flutter-logo',
                    child: FlutterLogo(size: 300),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(routeContext).pop();
                    },
                    child: const Text('Back'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: const [
        Section(
          label: 'Hero',
          child: Hero(
            tag: 'flutter-logo',
            child: FlutterLogo(size: 100),
          ),
        ),
      ],
      options: [
        ElevatedButton(
          onPressed: () async {
            await _showHero(context: context);
          },
          child: const Text('Show Hero'),
        ),
      ],
    );
  }
}
