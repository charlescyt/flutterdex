import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'expandable.dart';
import 'label_divider.dart';

class Section extends StatefulWidget {
  const Section({
    super.key,
    required this.label,
    this.description,
    this.initiallyExpanded = true,
    required this.child,
  });

  final String label;
  final String? description;
  final bool initiallyExpanded;
  final Widget child;

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  void didUpdateWidget(covariant Section oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LabelDivider(
          label: widget.label,
          onTap: () => setState(() => _isExpanded = !_isExpanded),
        ),
        const SizedBox(height: 4),
        Expandable(
          isExpanded: _isExpanded,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                children: [
                  if (widget.description case final String description) ...[
                    Text(description),
                    const SizedBox(height: 12),
                  ],
                  widget.child,
                ],
              ),
            ),
          ),
        ),
      ],
    )
        .animate() //
        .fadeIn(duration: 800.ms);
  }
}

class OptionsSection extends StatefulWidget {
  const OptionsSection({
    super.key,
    required this.children,
    this.constraints = const BoxConstraints(maxHeight: 300),
  });

  final List<Widget> children;
  final BoxConstraints constraints;

  @override
  State<OptionsSection> createState() => _OptionsSectionState();
}

class _OptionsSectionState extends State<OptionsSection> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LabelDivider(
            label: 'Options',
            onTap: () => setState(() => _isExpanded = !_isExpanded),
          ),
          ConstrainedBox(
            constraints: widget.constraints,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Expandable(
                isExpanded: _isExpanded,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widget.children,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
