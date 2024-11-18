import 'package:flutter/foundation.dart';
import 'package:shared_preferences.dart';

class EmailProvider with ChangeNotifier {
  final List<String> _emails = [];
  final String _prefsKey = 'monitor_emails';
  late SharedPreferences _prefs;

  List<String> get emails => List.unmodifiable(_emails);

  EmailProvider() {
    _loadEmails();
  }

  Future<void> _loadEmails() async {
    _prefs = await SharedPreferences.getInstance();
    final savedEmails = _prefs.getStringList(_prefsKey) ?? [];
    _emails.addAll(savedEmails);
    notifyListeners();
  }

  Future<void> addEmail(String email) async {
    if (!_emails.contains(email)) {
      _emails.add(email);
      await _saveEmails();
      notifyListeners();
    }
  }

  Future<void> removeEmail(String email) async {
    _emails.remove(email);
    await _saveEmails();
    notifyListeners();
  }

  Future<void> _saveEmails() async {
    await _prefs.setStringList(_prefsKey, _emails);
  }
}