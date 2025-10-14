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
      // ComponentItem(
      //   title: 'Sample Page',
      //   description: '/figma-mcp-create',
      //   onTap: () {},
      // ),
      //
      // Create a screen at the location where this is tapped.

      // claude mcp add --transport sse figma-dev-mode-mcp-server http://127.0.0.1:3845/sse
      ComponentItem(
        title: 'Sample Page',
        description: '/figma-mcp-create',
        onTap: () {},
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: const Text('Figma Components'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
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
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 14,
                  ),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).colorScheme.outline,
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
