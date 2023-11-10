import 'package:flutter/material.dart';

import '../utils/debouncer.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.onChanged,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
    this.hintText,
  });

  final ValueChanged<String> onChanged;
  final Duration debounceDuration;
  final EdgeInsets margin;
  final String? hintText;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller;
  late final Debouncer _debouncer;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() => _debouncer.debounce(() => widget.onChanged(_controller.text)));
    _debouncer = Debouncer(widget.debounceDuration);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _debouncer.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onTapOutside: (_) {
          if (_focusNode.hasFocus) {
            _focusNode.unfocus();
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _controller.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _controller.clear,
                ),
        ),
      ),
    );
  }
}
