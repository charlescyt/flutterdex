import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/settings/providers/settings_provider.dart';
import 'app_initializer.dart';
import 'router/router.dart';
import 'theme/theme.dart';
import 'utils/app_scroll_behavior.dart';

class FlutterDex extends ConsumerWidget {
  const FlutterDex({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appInitializer = ref.watch(appInitializerProvider);
    return appInitializer.isLoading
        ? const _SplashPage()
            .animate() //
            .fadeIn(duration: 500.ms, curve: Curves.easeInOut)
        : const _App()
            .animate() //
            .fadeIn(duration: 1000.ms, curve: Curves.easeInOut);
  }
}

class _SplashPage extends StatelessWidget {
  const _SplashPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox.expand(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 128,
                height: 128,
              )
                  .animate(onPlay: (controller) => controller.repeat(reverse: true)) //
                  .scaleXY(
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                    begin: 0.8,
                    end: 1,
                  ),
              Text(
                'FlutterDex',
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              )
                  .animate(onPlay: (controller) => controller.repeat()) //
                  .shimmer(duration: 1.5.seconds, curve: Curves.easeInOut),
            ],
          ),
        ),
      ),
    );
  }
}

class _App extends ConsumerWidget {
  const _App();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(currentSettingsProvider.select((value) => value.themeMode));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutterdex',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      scrollBehavior: const AppScrollBehavior(),
    );
  }
}
