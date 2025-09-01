import 'package:flutter/material.dart';
import '../theme/color_system.dart';

class ColorSystemDemo extends StatefulWidget {
  const ColorSystemDemo({super.key});

  @override
  State<ColorSystemDemo> createState() => _ColorSystemDemoState();
}

class _ColorSystemDemoState extends State<ColorSystemDemo> with SingleTickerProviderStateMixin {
  bool isDarkMode = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                    isDarkMode ? 'Dark' : 'Light',
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
          bottom: TabBar(
            controller: _tabController,
            labelColor: colorScheme.primary,
            unselectedLabelColor: colorScheme.onSurface.withValues(alpha: 0.6),
            indicatorColor: colorScheme.primary,
            tabs: const [
              Tab(text: 'Current Theme'),
              Tab(text: 'Color Guidance'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildCurrentThemeTab(colorScheme),
            _buildColorGuidanceTab(colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentThemeTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isDarkMode ? 'Dark Theme Colors' : 'Light Theme Colors',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          _buildThemeColors(colorScheme),
        ],
      ),
    );
  }

  Widget _buildColorGuidanceTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tonal Palettes Section
            _buildTonalPalettesSection(colorScheme),
            const SizedBox(height: 48),
            // Color Schemes Section
            _buildColorSchemesSection(colorScheme),
          ],
        ),
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

  Widget _buildTonalPalettesSection(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tonal Palettes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 24),
        _buildTonalPaletteRow('Primary', [
          TonalColor('0', FigmaColors.primary0),
          TonalColor('10', FigmaColors.primary10),
          TonalColor('20', FigmaColors.primary20),
          TonalColor('30', FigmaColors.primary30),
          TonalColor('40', FigmaColors.primary40),
          TonalColor('50', FigmaColors.primary50),
          TonalColor('60', FigmaColors.primary60),
          TonalColor('70', FigmaColors.primary70),
          TonalColor('80', FigmaColors.primary80),
          TonalColor('90', FigmaColors.primary90),
          TonalColor('95', FigmaColors.primary95),
          TonalColor('99', FigmaColors.primary99),
          TonalColor('100', FigmaColors.primary100),
        ]),
        const SizedBox(height: 16),
        _buildTonalPaletteRow('Secondary', [
          TonalColor('0', FigmaColors.secondary0),
          TonalColor('10', FigmaColors.secondary10),
          TonalColor('20', FigmaColors.secondary20),
          TonalColor('30', FigmaColors.secondary30),
          TonalColor('40', FigmaColors.secondary40),
          TonalColor('50', FigmaColors.secondary50),
          TonalColor('60', FigmaColors.secondary60),
          TonalColor('70', FigmaColors.secondary70),
          TonalColor('80', FigmaColors.secondary80),
          TonalColor('90', FigmaColors.secondary90),
          TonalColor('95', FigmaColors.secondary95),
          TonalColor('99', const Color(0xFFE3FFFE)), // Secondary99 from Figma
          TonalColor('100', FigmaColors.secondary100),
        ]),
        const SizedBox(height: 16),
        _buildTonalPaletteRow('Tertiary', [
          TonalColor('0', const Color(0xFFA1A1A1)),
          TonalColor('10', const Color(0xFFA1A1A1)),
          TonalColor('20', const Color(0xFFA1A1A1)),
          TonalColor('30', const Color(0xFFA1A1A1)),
          TonalColor('40', const Color(0xFFA1A1A1)),
          TonalColor('50', const Color(0xFFA1A1A1)),
          TonalColor('60', const Color(0xFFA1A1A1)),
          TonalColor('70', const Color(0xFFA1A1A1)),
          TonalColor('80', const Color(0xFFA1A1A1)),
          TonalColor('90', const Color(0xFFA1A1A1)),
          TonalColor('95', const Color(0xFFA1A1A1)),
          TonalColor('99', const Color(0xFFA1A1A1)),
          TonalColor('100', const Color(0xFFA1A1A1)),
        ]),
        const SizedBox(height: 16),
        _buildTonalPaletteRow('Error', [
          TonalColor('0', FigmaColors.error0),
          TonalColor('10', FigmaColors.error10),
          TonalColor('20', FigmaColors.error20),
          TonalColor('30', FigmaColors.error30),
          TonalColor('40', FigmaColors.error40),
          TonalColor('50', FigmaColors.error50),
          TonalColor('60', FigmaColors.error60),
          TonalColor('70', FigmaColors.error70),
          TonalColor('80', FigmaColors.error80),
          TonalColor('90', FigmaColors.error90),
          TonalColor('95', FigmaColors.error95),
          TonalColor('99', FigmaColors.error99),
          TonalColor('100', FigmaColors.error100),
        ]),
        const SizedBox(height: 16),
        _buildTonalPaletteRow('Neutral', [
          TonalColor('0', FigmaColors.neutral0),
          TonalColor('10', FigmaColors.neutral10),
          TonalColor('20', FigmaColors.neutral20),
          TonalColor('30', FigmaColors.neutral30),
          TonalColor('40', FigmaColors.neutral40),
          TonalColor('50', FigmaColors.neutral50),
          TonalColor('60', FigmaColors.neutral60),
          TonalColor('70', FigmaColors.neutral70),
          TonalColor('80', FigmaColors.neutral80),
          TonalColor('90', FigmaColors.neutral90),
          TonalColor('95', FigmaColors.neutral95),
          TonalColor('99', FigmaColors.neutral99),
          TonalColor('100', FigmaColors.neutral100),
        ]),
        const SizedBox(height: 16),
        _buildTonalPaletteRow('Neutral Variant', [
          TonalColor('0', const Color(0xFF000000)),
          TonalColor('10', const Color(0xFF1C1B1C)),
          TonalColor('20', const Color(0xFF313031)),
          TonalColor('30', const Color(0xFF484647)),
          TonalColor('40', const Color(0xFFB0B0B0)),
          TonalColor('50', const Color(0xFFB0B0B0)),
          TonalColor('60', const Color(0xFFB0B0B0)),
          TonalColor('70', const Color(0xFFB0B0B0)),
          TonalColor('80', const Color(0xFFB0B0B0)),
          TonalColor('90', const Color(0xFFB0B0B0)),
          TonalColor('95', const Color(0xFFB0B0B0)),
          TonalColor('99', const Color(0xFFB0B0B0)),
          TonalColor('100', const Color(0xFFB0B0B0)),
        ]),
      ],
    );
  }

  Widget _buildTonalPaletteRow(String label, List<TonalColor> colors) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        ...colors.map((tonalColor) => Expanded(
              child: Container(
                height: 60,
                color: tonalColor.color,
                alignment: Alignment.center,
                child: Text(
                  tonalColor.tone,
                  style: TextStyle(
                    color: _getContrastColor(tonalColor.color),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildColorSchemesSection(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Schemes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Light Theme Column
            Expanded(
              child: _buildThemeColumn('Light Theme', lightColorScheme),
            ),
            const SizedBox(width: 24),
            // Dark Theme Column
            Expanded(
              child: _buildThemeColumn('Dark Theme', darkColorScheme),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildThemeColumn(String title, ColorScheme scheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: scheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        // Primary Colors
        _buildColorRow([
          SchemeColor('Primary', 'P-40', scheme.primary),
          SchemeColor('Secondary', 'S-40', scheme.secondary),
        ]),
        const SizedBox(height: 8),
        _buildColorRow([
          SchemeColor('On Primary', 'P-100', scheme.onPrimary),
          SchemeColor('On Secondary', 'S-100', scheme.onSecondary),
        ]),
        const SizedBox(height: 8),
        _buildColorRow([
          SchemeColor('Primary Container', 'P-90', scheme.primaryContainer),
          SchemeColor('Secondary Container', 'S-90', scheme.secondaryContainer),
        ]),
        const SizedBox(height: 8),
        _buildColorRow([
          SchemeColor('On Primary Container', 'P-10', scheme.onPrimaryContainer),
          SchemeColor('On Secondary Container', 'S-10', scheme.onSecondaryContainer),
        ]),
        const SizedBox(height: 16),
        // Error Colors
        _buildColorRow([
          SchemeColor('Error', 'E-40', scheme.error),
        ]),
        const SizedBox(height: 8),
        _buildColorRow([
          SchemeColor('On Error', 'E-100', scheme.onError),
        ]),
        const SizedBox(height: 8),
        _buildColorRow([
          SchemeColor('Error Container', 'E-90', scheme.errorContainer),
        ]),
        const SizedBox(height: 8),
        _buildColorRow([
          SchemeColor('On Error Container', 'E-10', scheme.onErrorContainer),
        ]),
        const SizedBox(height: 16),
        // Surface Colors
        _buildSurfaceSection(scheme),
      ],
    );
  }

  Widget _buildColorRow(List<SchemeColor> colors) {
    return Row(
      children: colors.map((schemeColor) => Expanded(
            child: Container(
              height: 60,
              color: schemeColor.color,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    schemeColor.label,
                    style: TextStyle(
                      color: _getContrastColor(schemeColor.color),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    schemeColor.code,
                    style: TextStyle(
                      color: _getContrastColor(schemeColor.color).withValues(alpha: 0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )).toList(),
    );
  }

  Widget _buildSurfaceSection(ColorScheme scheme) {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: scheme.surface,
            border: Border.all(color: scheme.outline.withValues(alpha: 0.2)),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Surface Dim',
                    style: TextStyle(
                      color: scheme.onSurface,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'N-20',
                    style: TextStyle(
                      color: scheme.onSurface.withValues(alpha: 0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Surface',
                    style: TextStyle(
                      color: scheme.onSurface,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'N-100',
                    style: TextStyle(
                      color: scheme.onSurface.withValues(alpha: 0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Surface Bright',
                    style: TextStyle(
                      color: scheme.onSurface,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'N-100',
                    style: TextStyle(
                      color: scheme.onSurface.withValues(alpha: 0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                color: scheme.inverseSurface,
                alignment: Alignment.center,
                child: Text(
                  'Inverse Surface\nN-20',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: scheme.onInverseSurface,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Container(
                height: 40,
                color: scheme.inversePrimary,
                alignment: Alignment.center,
                child: Text(
                  'Inverse Primary\nP-80',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _getContrastColor(scheme.inversePrimary),
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: scheme.outline),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Outline',
                style: TextStyle(
                  color: scheme.onSurface,
                  fontSize: 10,
                ),
              ),
              Text(
                'NV-50',
                style: TextStyle(
                  color: scheme.onSurface.withValues(alpha: 0.7),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: scheme.outlineVariant),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Outline Variant',
                style: TextStyle(
                  color: scheme.onSurface,
                  fontSize: 10,
                ),
              ),
              Text(
                'NV-80',
                style: TextStyle(
                  color: scheme.onSurface.withValues(alpha: 0.7),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text(
                  'Scrim\nN-0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.5),
                      Colors.black.withValues(alpha: 0.0),
                    ],
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Shadow\nN-0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
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

class TonalColor {
  final String tone;
  final Color color;

  TonalColor(this.tone, this.color);
}

class SchemeColor {
  final String label;
  final String code;
  final Color color;

  SchemeColor(this.label, this.code, this.color);
}