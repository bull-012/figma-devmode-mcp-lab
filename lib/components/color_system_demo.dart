import 'package:flutter/material.dart';

import '../theme/color_system.dart';

class ColorSystemDemo extends StatefulWidget {
  const ColorSystemDemo({super.key});

  @override
  State<ColorSystemDemo> createState() => _ColorSystemDemoState();
}

class _ColorSystemDemoState extends State<ColorSystemDemo> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = isDarkMode ? darkColorScheme : lightColorScheme;

    return Theme(
      data: ThemeData(useMaterial3: true, colorScheme: colorScheme),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: const Text('Color System'),
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  Text(
                    'Dark Mode',
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  const SizedBox(width: 8),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                    activeThumbColor: colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Color Guidance',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 32),

              // Theme Colors
              _buildSectionTitle(
                isDarkMode ? 'Dark Theme' : 'Light Theme',
                colorScheme,
              ),
              const SizedBox(height: 16),
              _buildThemeColors(colorScheme),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, ColorScheme colorScheme) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
    );
  }

  Widget _buildThemeColors(ColorScheme colorScheme) {
    final colorGroups = [
      // Primary colors
      [
        ColorItem('primary', colorScheme.primary),
        ColorItem('onPrimary', colorScheme.onPrimary),
        ColorItem('primaryContainer', colorScheme.primaryContainer),
        ColorItem('onPrimaryContainer', colorScheme.onPrimaryContainer),
      ],
      // Secondary colors
      [
        ColorItem('secondary', colorScheme.secondary),
        ColorItem('onSecondary', colorScheme.onSecondary),
        ColorItem('secondaryContainer', colorScheme.secondaryContainer),
        ColorItem('onSecondaryContainer', colorScheme.onSecondaryContainer),
      ],
      // Tertiary colors
      [
        ColorItem('tertiary', colorScheme.tertiary),
        ColorItem('onTertiary', colorScheme.onTertiary),
        ColorItem('tertiaryContainer', colorScheme.tertiaryContainer),
        ColorItem('onTertiaryContainer', colorScheme.onTertiaryContainer),
      ],
      // Error colors
      [
        ColorItem('error', colorScheme.error),
        ColorItem('onError', colorScheme.onError),
        ColorItem('errorContainer', colorScheme.errorContainer),
        ColorItem('onErrorContainer', colorScheme.onErrorContainer),
      ],
      // Surface colors
      [
        ColorItem('surface', colorScheme.surface),
        ColorItem('onSurface', colorScheme.onSurface),
        ColorItem(
          'surfaceContainerHighest',
          colorScheme.surfaceContainerHighest,
        ),
        ColorItem('onSurfaceVariant', colorScheme.onSurfaceVariant),
      ],
      // Fixed colors
      [
        ColorItem('primaryFixed', colorScheme.primaryFixed),
        ColorItem('primaryFixedDim', colorScheme.primaryFixedDim),
        ColorItem('onPrimaryFixed', colorScheme.onPrimaryFixed),
        ColorItem('onPrimaryFixedVariant', colorScheme.onPrimaryFixedVariant),
      ],
      // Surface variants
      [
        ColorItem('surfaceDim', colorScheme.surfaceDim),
        ColorItem('surfaceBright', colorScheme.surfaceBright),
        ColorItem('surfaceContainerLow', colorScheme.surfaceContainerLow),
        ColorItem('surfaceContainerHigh', colorScheme.surfaceContainerHigh),
      ],
      // Outline colors
      [
        ColorItem('outline', colorScheme.outline),
        ColorItem('outlineVariant', colorScheme.outlineVariant),
        ColorItem('inverseSurface', colorScheme.inverseSurface),
        ColorItem('onInverseSurface', colorScheme.onInverseSurface),
      ],
    ];

    return Column(
      children: colorGroups.map((group) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: group.map((item) {
              return Expanded(child: _buildColorCard(item, colorScheme));
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildColorCard(ColorItem item, ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 80,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.name,
              style: TextStyle(
                fontSize: 10,
                color: _getContrastColor(item.color),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              '#${item.color.red.toRadixString(16).padLeft(2, '0')}${item.color.green.toRadixString(16).padLeft(2, '0')}${item.color.blue.toRadixString(16).padLeft(2, '0')}'.toUpperCase(),
              style: TextStyle(
                fontSize: 8,
                color: _getContrastColor(item.color).withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getContrastColor(Color color) {
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}

class ColorItem {
  final String name;
  final Color color;

  ColorItem(this.name, this.color);
}
