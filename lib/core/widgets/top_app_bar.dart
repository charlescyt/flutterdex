import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _appBarHeight = 50.0;

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
  });

  final Widget title;
  final List<Widget>? actions;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);
    final canPop = context.canPop();
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: viewPadding.top),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: _appBarHeight),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (canPop)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () => Navigator.maybePop(context),
                      ),
                    ),
                  DefaultTextStyle.merge(
                    style: theme.textTheme.titleLarge,
                    child: title,
                  ),
                  if (actions case final List<Widget> actions when actions.isNotEmpty)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: actions,
                      ),
                    ),
                ],
              ),
            ),
            if (bottom case final Widget bottom) bottom,
          ],
        ),
      ),
    );
  }
}
