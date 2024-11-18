import 'package:flutter/foundation.dart';
import '../models/website.dart';
import '../services/website_monitor_service.dart';

class WebsiteProvider with ChangeNotifier {
  final List<Website> _websites = [];
  final WebsiteMonitorService _monitorService = WebsiteMonitorService();

  List<Website> get websites => List.unmodifiable(_websites);

  void addWebsite(String url) {
    final website = Website(
      url: url,
      lastChecked: DateTime.now(),
    );
    _websites.add(website);
    _monitorWebsite(website);
    notifyListeners();
  }

  void removeWebsite(Website website) {
    _websites.remove(website);
    notifyListeners();
  }

  Future<void> _monitorWebsite(Website website) async {
    await _monitorService.monitorWebsite(website);
    notifyListeners();
  }

  Future<void> checkAllWebsites() async {
    for (final website in _websites) {
      await _monitorWebsite(website);
    }
  }
}