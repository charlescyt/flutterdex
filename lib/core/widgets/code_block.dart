import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/github.dart';
import 'package:flutter_highlighter/themes/monokai-sublime.dart';

import '../utils/copy_to_clipboard.dart';
import '../utils/snack_bar.dart';

class CodeBlock extends StatefulWidget {
  const CodeBlock({
    super.key,
    this.code,
    this.filePath,
    this.showCopyButton = true,
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
    this.padding = const EdgeInsets.all(8),
  }) : assert(code != null || filePath != null, 'Either the code or the filePath must be provided.');

  final String? code;
  final String? filePath;
  final bool showCopyButton;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  State<CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock> {
  @override
  Widget build(BuildContext context) {
    if (widget.code case final String code) {
      return _CodeBlock(
        code: code,
        showCopyButton: widget.showCopyButton,
        margin: widget.margin,
        padding: widget.padding,
      );
    }

    if (widget.filePath case final String filePath) {
      return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(filePath),
        builder: (_, snapshot) => switch (snapshot) {
          AsyncSnapshot(hasData: true, data: final String code) when code.isNotEmpty => _CodeBlock(
              code: code,
              showCopyButton: widget.showCopyButton,
              margin: widget.margin,
              padding: widget.padding,
            ),
          AsyncSnapshot(hasData: true) => const Center(child: Text('Error: The file is empty')),
          AsyncSnapshot(hasError: true, :final error) => Center(child: Text('Error: $error')),
          _ => const Center(child: CircularProgressIndicator()),
        },
      );
    }

    return const Center(
      child: Text('Error: Either the code or the filePath must be provided.'),
    );
  }
}

class _CodeBlock extends StatelessWidget {
  const _CodeBlock({
    required this.code,
    this.showCopyButton = true,
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
    this.padding = const EdgeInsets.all(8),
  });

  final String code;
  final bool showCopyButton;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final codeBlockTheme = theme.brightness == Brightness.light ? githubTheme : monokaiSublimeTheme;

    final widget = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: HighlightView(
        code,
        language: 'dart',
        theme: codeBlockTheme,
        padding: padding,
        textStyle: theme.textTheme.bodySmall?.copyWith(
          fontFamily: 'JetBrainsMono',
        ),
      )
          .animate() //
          .fadeIn(duration: 800.ms, curve: Curves.easeInOut),
    );

    return Padding(
      padding: margin,
      child: Material(
        color: codeBlockTheme['root']?.backgroundColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: theme.dividerColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: switch (showCopyButton) {
            false => widget,
            true => Stack(
                children: [
                  widget,
                  Positioned(
                    right: 4,
                    top: 4,
                    child: IconButton(
                      icon: const Icon(Icons.copy_outlined),
                      color: theme.colorScheme.inverseSurface,
                      tooltip: 'Copy to clipboard',
                      onPressed: () async {
                        await copyToClipboard(text: code);
                        if (context.mounted) {
                          showFloatingSnackBar(
                            context: context,
                            message: 'Copied to clipboard',
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
          },
        ),
      ),
    );
  }
}
