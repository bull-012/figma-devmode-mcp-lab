import 'package:flutter/material.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final components = [
      ComponentItem(
        title: 'Button Component',
        description: 'Primary and secondary buttons',
        onTap: () {
          // TODO: Navigate to Button demo
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Button Component - Coming soon')),
          );
        },
      ),
      ComponentItem(
        title: 'Card Component',
        description: 'Card layouts and variations',
        onTap: () {
          // TODO: Navigate to Card demo
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Card Component - Coming soon')),
          );
        },
      ),
      ComponentItem(
        title: 'Input Fields',
        description: 'Text fields and form inputs',
        onTap: () {
          // TODO: Navigate to Input demo
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Input Fields - Coming soon')),
          );
        },
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Figma Components'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: components.length,
        itemBuilder: (context, index) {
          final component = components[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                component.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  component.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[400],
              ),
              onTap: component.onTap,
            ),
          );
        },
      ),
    );
  }
}

class ComponentItem {
  final String title;
  final String description;
  final VoidCallback onTap;

  const ComponentItem({
    required this.title,
    required this.description,
    required this.onTap,
  });
}