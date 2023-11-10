import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/links.dart';
import '../../../core/theme/theme_mode_extension.dart';
import '../../../core/utils/package_info/package_info.dart';
import '../../../core/utils/string_extension.dart';
import '../../../core/utils/url_launcher/url_launcher.dart';
import '../../../core/widgets/app_modal_bottom_sheet.dart';
import '../../../core/widgets/simulator.dart';
import '../../../core/widgets/top_app_bar.dart';
import '../providers/settings_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Future<void> _showThemeModeModalBottomSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      useRootNavigator: true,
      useSafeArea: true,
      context: context,
      builder: (_) => Consumer(
        builder: (_, ref, __) {
          final currentThemeMode = ref.watch(currentSettingsProvider.select((value) => value.themeMode));
          return AppModalBottomSheet(
            selected: currentThemeMode,
            items: ThemeMode.values,
            titleBuilder: (item) => Text(item.label),
            onSelected: (value) => ref.read(currentSettingsProvider.notifier).setThemeMode(value),
          );
        },
      ),
    );
  }

  Future<void> _showSimulatorTypeBottomSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      useRootNavigator: true,
      useSafeArea: true,
      context: context,
      builder: (_) => Consumer(
        builder: (_, ref, __) {
          final currentSimulatorType = ref.watch(currentSettingsProvider.select((value) => value.simulatorType));
          return AppModalBottomSheet(
            selected: currentSimulatorType,
            items: SimulatorType.values,
            titleBuilder: (item) => Text(item.label),
            onSelected: (value) => ref.read(currentSettingsProvider.notifier).setSimulatorType(value),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(currentSettingsProvider);
    final packageInfo = ref.watch(packageInfoProvider);
    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            const TopAppBar(title: Text('Settings')),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList.list(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: [
                        ListTile(
                          title: const Text('Theme Mode'),
                          subtitle: Text(settings.themeMode.label),
                          leading: const Icon(Icons.color_lens_outlined),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () async => _showThemeModeModalBottomSheet(context),
                        ),
                        ListTile(
                          title: const Text('Simulator Type'),
                          subtitle: Text(settings.simulatorType.label),
                          leading: settings.simulatorType == SimulatorType.ios //
                              ? const Icon(Icons.phone_iphone_outlined)
                              : const Icon(Icons.phone_android_outlined),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () async => _showSimulatorTypeBottomSheet(context),
                        ),
                        ListTile(
                          leading: const Icon(Icons.lightbulb_outline),
                          title: const Text('Request a feature'),
                          subtitle: const Text('Have an idea? Request it here'),
                          onTap: () async => launchUrlString(Links.featureRequest),
                        ),
                        ListTile(
                          leading: const Icon(Icons.bug_report_outlined),
                          title: const Text('Report a bug'),
                          subtitle: const Text('Found a bug? Report it here'),
                          onTap: () async => launchUrlString(Links.bugReport),
                        ),
                      ],
                    ).toList(),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          Assets.logo,
                          width: 32,
                          height: 32,
                        ),
                        Text('${packageInfo.appName.capitalize} v${packageInfo.version}'),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Made with '),
                              WidgetSpan(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 14,
                                ),
                              ),
                              TextSpan(text: ' by Charles'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
