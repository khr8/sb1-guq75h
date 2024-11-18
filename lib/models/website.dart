class Website {
  final String url;
  bool isUp;
  bool sslValid;
  DateTime lastChecked;

  Website({
    required this.url,
    this.isUp = true,
    this.sslValid = true,
    required this.lastChecked,
  });

  Map<String, dynamic> toJson() => {
    'url': url,
    'isUp': isUp,
    'sslValid': sslValid,
    'lastChecked': lastChecked.toIso8601String(),
  };

  factory Website.fromJson(Map<String, dynamic> json) => Website(
    url: json['url'],
    isUp: json['isUp'],
    sslValid: json['sslValid'],
    lastChecked: DateTime.parse(json['lastChecked']),
  );
}