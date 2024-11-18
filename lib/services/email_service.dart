import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  Future<void> sendAlert({
    required List<String> recipients,
    required String website,
    required String issue,
  }) async {
    final message = Message()
      ..from = const Address('your-email@example.com')
      ..recipients.addAll(recipients)
      ..subject = 'Website Monitor Alert: $website'
      ..text = 'Issue detected with $website: $issue';

    // Configure your SMTP server details
    final smtpServer = gmail('your-email@example.com', 'your-app-password');

    try {
      await send(message, smtpServer);
    } catch (e) {
      // Handle email sending errors
      print('Error sending email: $e');
    }
  }
}