import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_monitor/providers/website_provider.dart';
import 'package:website_monitor/providers/email_provider.dart';
import 'package:website_monitor/screens/home_screen.dart';
import 'package:website_monitor/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initialize();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WebsiteProvider()),
        ChangeNotifierProvider(create: (_) => EmailProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Website Monitor',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}