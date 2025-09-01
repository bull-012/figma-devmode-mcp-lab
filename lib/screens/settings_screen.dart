import 'package:flutter/material.dart';
import '../components/typography_demo.dart';
import '../components/color_system_demo.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _buildSection(
            title: 'Design System',
            items: [
              _SettingItem(
                icon: Icons.text_fields,
                title: 'Typography System',
                subtitle: 'View font styles and text hierarchy',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TypographyDemo(),
                    ),
                  );
                },
              ),
              _SettingItem(
                icon: Icons.palette,
                title: 'Color System',
                subtitle: 'Color palette and themes',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ColorSystemDemo(),
                    ),
                  );
                },
              ),
              _SettingItem(
                icon: Icons.space_dashboard,
                title: 'Spacing System',
                subtitle: 'Padding, margins, and gaps',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Spacing System - Coming soon')),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            title: 'App Settings',
            items: [
              _SettingItem(
                icon: Icons.dark_mode,
                title: 'Theme',
                subtitle: 'Light / Dark mode',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {
                    // TODO: Implement theme switching
                  },
                ),
              ),
              _SettingItem(
                icon: Icons.language,
                title: 'Language',
                subtitle: 'Japanese',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Language settings - Coming soon')),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            title: 'About',
            items: [
              _SettingItem(
                icon: Icons.info_outline,
                title: 'Version',
                subtitle: '1.0.0',
                onTap: () {},
              ),
              _SettingItem(
                icon: Icons.code,
                title: 'Source Code',
                subtitle: 'View on GitHub',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening GitHub repository...')),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<_SettingItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: items.map((item) {
              return ListTile(
                leading: item.icon != null
                    ? Icon(
                        item.icon,
                        color: Colors.grey[700],
                        size: 24,
                      )
                    : null,
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: item.subtitle != null
                    ? Text(
                        item.subtitle!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      )
                    : null,
                trailing: item.trailing ??
                    (item.onTap != null
                        ? Icon(
                            Icons.chevron_right,
                            color: Colors.grey[400],
                          )
                        : null),
                onTap: item.onTap,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _SettingItem {
  final IconData? icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingItem({
    this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });
}