import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/url_launcher/url_launcher.dart';
import '../../../core/widgets/code_block.dart';
import '../../../core/widgets/simulator.dart';
import '../../../core/widgets/top_app_bar.dart';
import '../../settings/providers/settings_provider.dart';
import '../demos/demos.dart';
import '../models/flutter_widget.dart';
import '../providers/widgets_provider.dart';
import '../widgets/widget_info_section.dart';
import 'widget_unavailable_page.dart';

class WidgetDetailsPage extends ConsumerWidget {
  const WidgetDetailsPage({
    super.key,
    required this.id,
  });

  final String id;

  static const demoMap = {
    'about-dialog': AboutDialogDemo(),
    'alert-dialog': AlertDialogDemo(),
    'align': AlignDemo(),
    'animated-align': AnimatedAlignDemo(),
    'animated-container': AnimatedContainerDemo(),
    'animated-cross-fade': AnimatedCrossFadeDemo(),
    'animated-opacity': AnimatedOpacityDemo(),
    'animated-padding': AnimatedPaddingDemo(),
    'animated-positioned': AnimatedPositionedDemo(),
    'animated-rotation': AnimatedRotationDemo(),
    'animated-scale': AnimatedScaleDemo(),
    'animated-size': AnimatedSizeDemo(),
    'animated-slide': AnimatedSlideDemo(),
    'animated-switcher': AnimatedSwitcherDemo(),
    'app-bar': AppBarDemo(),
    'aspect-ratio': AspectRatioDemo(),
    'badge': BadgeDemo(),
    'card': CardDemo(),
    'center': CenterDemo(),
    'checkbox': CheckboxDemo(),
    'circular-progress-indicator': CircularProgressIndicatorDemo(),
    'column': ColumnDemo(),
    'container': ContainerDemo(),
    'cupertino-alert-dialog': CupertinoAlertDialogDemo(),
    'cupertino-button': CupertinoButtonDemo(),
    'cupertino-date-picker': CupertinoDatePickerDemo(),
    'cupertino-picker': CupertinoPickerDemo(),
    'cupertino-slider': CupertinoSliderDemo(),
    'cupertino-switch': CupertinoSwitchDemo(),
    'cupertino-timer-picker': CupertinoTimerPickerDemo(),
    'dropdown-button': DropdownButtonDemo(),
    'elevated-button': ElevatedButtonDemo(),
    'expanded': ExpandedDemo(),
    'filled-button': FilledButtonDemo(),
    'flexible': FlexibleDemo(),
    'floating-action-button': FloatingActionButtonDemo(),
    'fractionally-sized-box': FractionallySizedBoxDemo(),
    'grid-view': GridViewDemo(),
    'hero': HeroDemo(),
    'icon-button': IconButtonDemo(),
    'icon': IconDemo(),
    'image': ImageDemo(),
    'linear-progress-indicator': LinearProgressIndicatorDemo(),
    'list-view': ListViewDemo(),
    'outlined-button': OutlinedButtonDemo(),
    'placeholder': PlaceholderDemo(),
    'positioned': PositionedDemo(),
    'radio': RadioDemo(),
    'row': RowDemo(),
    'scaffold': ScaffoldDemo(),
    'segmented-button': SegmentedButtonDemo(),
    'single-child-scroll-view': SingleChildScrollViewDemo(),
    'sized-box': SizedBoxDemo(),
    'slider': SliderDemo(),
    'spacer': SpacerDemo(),
    'stack': StackDemo(),
    'switch': SwitchDemo(),
    'text-button': TextButtonDemo(),
    'text': TextDemo(),
    'text-field': TextFieldDemo(),
    'wrap': WrapDemo(),
  };

  String get demoFilePath => 'lib/features/flutter_widget/demos/${id.replaceAll('-', '_')}_demo.dart';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flutterWidget = ref.watch(flutterWidgetProvider(id: id));
    final demo = demoMap[id];
    return switch ((flutterWidget, demo)) {
      (null, _) || (_, null) => WidgetUnavailablePage(id: id),
      (final FlutterWidget flutterWidget, final Widget demo) => SlotLayout(
          config: {
            Breakpoints.smallAndUp: SlotLayout.from(
              key: const Key('Small'),
              builder: (_) => _Small(
                flutterWidget: flutterWidget,
                demo: demo,
                demoFilePath: demoFilePath,
              ),
            ),
            Breakpoints.large: SlotLayout.from(
              key: const Key('Large'),
              builder: (_) => _Large(
                flutterWidget: flutterWidget,
                demo: demo,
                demoFilePath: demoFilePath,
              ),
            ),
          },
        ),
    };
  }
}

class _Small extends ConsumerWidget {
  const _Small({
    required this.flutterWidget,
    required this.demo,
    required this.demoFilePath,
  });

  final FlutterWidget flutterWidget;
  final Widget demo;
  final String demoFilePath;

  static const tabItems = [
    (title: 'Info', icon: Icons.info_outline),
    (title: 'Demo', icon: Icons.phone_iphone_outlined),
    (title: 'Code', icon: Icons.code_outlined),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewPadding = MediaQuery.viewPaddingOf(context);
    final simulatorType = ref.watch(currentSettingsProvider.select((value) => value.simulatorType));

    final tabs = [
      for (final tabItem in tabItems)
        Tab(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(tabItem.icon),
              const SizedBox(width: 8),
              Text(tabItem.title),
            ],
          ),
        ),
    ];

    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: tabs.length,
        child: Column(
          children: [
            TopAppBar(
              title: Text(
                flutterWidget.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              actions: [
                Tooltip(
                  message: 'Official Documentation',
                  child: IconButton(
                    onPressed: () async {
                      await launchUrl(flutterWidget.url);
                    },
                    icon: const Icon(Icons.info_outline),
                  ),
                ),
              ],
              bottom: TabBar(tabs: tabs),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    WidgetInfoSection(
                      flutterWidget: flutterWidget,
                      padding: EdgeInsets.only(bottom: viewPadding.bottom),
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Simulator(
                            type: simulatorType,
                            child: demo,
                          ),
                        ),
                        SizedBox(height: viewPadding.bottom),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(child: CodeBlock(filePath: demoFilePath)),
                        SizedBox(height: viewPadding.bottom),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _Large extends ConsumerWidget {
  const _Large({
    required this.flutterWidget,
    required this.demo,
    required this.demoFilePath,
  });

  final FlutterWidget flutterWidget;
  final Widget demo;
  final String demoFilePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simulatorType = ref.watch(currentSettingsProvider.select((value) => value.simulatorType));
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopAppBar(
              title: Text(flutterWidget.label),
              actions: [
                Tooltip(
                  message: 'Official Documentation',
                  child: IconButton(
                    onPressed: () async => launchUrl(flutterWidget.url),
                    icon: const Icon(Icons.info_outline),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: theme.dividerColor, width: 2),
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: WidgetInfoSection(
                        flutterWidget: flutterWidget,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Simulator(
                      type: simulatorType,
                      child: demo,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CodeBlock(
                      filePath: demoFilePath,
                      margin: EdgeInsets.zero,
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
