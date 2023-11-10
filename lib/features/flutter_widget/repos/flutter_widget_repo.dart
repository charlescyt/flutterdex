import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:meta/meta.dart' show immutable;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/assets.dart';
import '../models/flutter_widget.dart';

part 'flutter_widget_repo.g.dart';

@Riverpod(keepAlive: true)
FlutterWidgetRepo flutterWidgetRepo(FlutterWidgetRepoRef ref) {
  return const FlutterWidgetRepo();
}

@immutable
class FlutterWidgetRepo {
  const FlutterWidgetRepo();

  Future<List<FlutterWidget>> loadFlutterWidgets() async {
    final jsonString = await rootBundle.loadString(Assets.flutterWidgetsData);
    final json = jsonDecode(jsonString) as List<dynamic>;
    final widgets = json.cast<Map<String, dynamic>>().map(FlutterWidget.fromJson).toList();
    return widgets;
  }
}
