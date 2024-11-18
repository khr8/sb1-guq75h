import 'package:flutter/material.dart';
import 'package:website_monitor/widgets/website_list.dart';
import 'package:website_monitor/widgets/email_list.dart';
import 'package:website_monitor/widgets/log_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WebsiteList(),
    const EmailList(),
    const LogList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'Websites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Emails',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Logs',
          ),
        ],
      ),
    );
  }
}