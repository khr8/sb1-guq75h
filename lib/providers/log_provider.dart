import 'package:flutter/foundation.dart';
import '../models/log_entry.dart';

class LogProvider with ChangeNotifier {
  final List<LogEntry> _logs = [];

  List<LogEntry> get logs => List.unmodifiable(_logs);

  void addLog(LogEntry log) {
    _logs.add(log);
    notifyListeners();
  }

  void clearLogs() {
    _logs.clear();
    notifyListeners();
  }
}