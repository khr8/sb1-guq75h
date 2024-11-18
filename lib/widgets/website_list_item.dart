import 'package:flutter/material.dart';
import '../models/website.dart';
import 'package:intl.dart';

class WebsiteListItem extends StatelessWidget {
  final Website website;

  const WebsiteListItem({
    super.key,
    required this.website,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(website.url),
        subtitle: Text(
          'Last checked: ${DateFormat.yMd().add_jm().format(website.lastChecked)}',
        ),
        leading: Icon(
          Icons.circle,
          color: website.isUp ? Colors.green : Colors.red,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.security,
              color: website.sslValid ? Colors.green : Colors.red,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Implement delete functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}