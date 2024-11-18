import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/website_provider.dart';
import '../models/website.dart';

class WebsiteList extends StatelessWidget {
  const WebsiteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Websites'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddWebsiteDialog(context),
          ),
        ],
      ),
      body: Consumer<WebsiteProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.websites.length,
            itemBuilder: (context, index) {
              final website = provider.websites[index];
              return WebsiteListItem(website: website);
            },
          );
        },
      ),
    );
  }

  void _showAddWebsiteDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Website'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Website URL',
            hintText: 'https://example.com',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                context.read<WebsiteProvider>().addWebsite(controller.text);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}