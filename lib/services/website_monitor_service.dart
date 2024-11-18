import 'package:http/http.dart' as http;
import 'package:ssl_scanner/ssl_scanner.dart';
import '../models/website.dart';

class WebsiteMonitorService {
  Future<bool> checkWebsiteStatus(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkSSLCertificate(String url) async {
    try {
      final scanner = SSLScanner(url);
      final result = await scanner.scan();
      return result.isValid && result.daysUntilExpiry > 30;
    } catch (e) {
      return false;
    }
  }

  Future<void> monitorWebsite(Website website) async {
    final isUp = await checkWebsiteStatus(website.url);
    final sslValid = await checkSSLCertificate(website.url);
    
    website.isUp = isUp;
    website.sslValid = sslValid;
    website.lastChecked = DateTime.now();
  }
}