import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

final _logger = Logger('UrlLauncher');

Future<void> launchUrl(Uri url) async {
  final canLaunchUrl = await url_launcher.canLaunchUrl(url);
  if (canLaunchUrl) {
    await url_launcher.launchUrl(url);
  } else {
    _logger.warning('Could not launch $url');
  }
}

Future<void> launchUrlString(String urlString) async {
  final url = Uri.tryParse(urlString);
  if (url != null) {
    await launchUrl(url);
  } else {
    _logger.warning('Could not parse $urlString');
  }
}
