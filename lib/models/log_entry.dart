class LogEntry {
  final DateTime timestamp;
  final String website;
  final String message;
  final LogType type;

  LogEntry({
    required this.timestamp,
    required this.website,
    required this.message,
    required this.type,
  });
}

enum LogType {
  info,
  warning,
  error,
}