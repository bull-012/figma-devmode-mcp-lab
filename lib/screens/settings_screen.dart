import 'package:flutter/material.dart';
import '../components/typography_demo.dart';
import '../components/color_system_demo.dart';
import '../theme/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
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
              _buildThemeSettingItem(context),
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

  _SettingItem _buildThemeSettingItem(BuildContext context) {
    final themeProvider = context.themeProvider;
    
    String getThemeModeText(ThemeMode mode) {
      switch (mode) {
        case ThemeMode.system:
          return 'System';
        case ThemeMode.light:
          return 'Light';
        case ThemeMode.dark:
          return 'Dark';
      }
    }
    
    return _SettingItem(
      icon: Icons.dark_mode,
      title: 'Theme',
      subtitle: getThemeModeText(themeProvider.themeMode),
      trailing: PopupMenuButton<ThemeMode>(
        initialValue: themeProvider.themeMode,
        onSelected: (ThemeMode mode) {
          themeProvider.setThemeMode(mode);
          setState(() {});
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<ThemeMode>>[
          const PopupMenuItem<ThemeMode>(
            value: ThemeMode.system,
            child: Text('System'),
          ),
          const PopupMenuItem<ThemeMode>(
            value: ThemeMode.light,
            child: Text('Light'),
          ),
          const PopupMenuItem<ThemeMode>(
            value: ThemeMode.dark,
            child: Text('Dark'),
          ),
        ],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              getThemeModeText(themeProvider.themeMode),
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
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
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Container(
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            children: items.map((item) {
              return ListTile(
                leading: item.icon != null
                    ? Icon(
                        item.icon,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      )
                    : null,
                trailing: item.trailing ??
                    (item.onTap != null
                        ? Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).colorScheme.outline,
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