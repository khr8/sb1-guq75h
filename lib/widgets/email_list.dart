import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/email_provider.dart';

class EmailList extends StatelessWidget {
  const EmailList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Recipients'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddEmailDialog(context),
          ),
        ],
      ),
      body: Consumer<EmailProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.emails.length,
            itemBuilder: (context, index) {
              final email = provider.emails[index];
              return ListTile(
                title: Text(email),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => provider.removeEmail(email),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showAddEmailDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Email'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Email Address',
            hintText: 'example@domain.com',
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                context.read<EmailProvider>().addEmail(controller.text);
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