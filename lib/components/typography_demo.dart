import 'package:flutter/material.dart';
import '../theme/typography.dart';

class TypographyDemo extends StatelessWidget {
  const TypographyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Typography System'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Typography title
            Text(
              'Typography',
              style: AppTypography.titleXL(),
            ),
            const SizedBox(height: 16),
            Text(
              'iOS - Noto Sans JP\nAndroid - Roboto (Figma uses Roboto)',
              style: AppTypography.bodyLRegular(),
            ),
            const SizedBox(height: 32),
            
            // Title Section
            _buildSection(
              title: 'Title',
              items: [
                _TypographyItem(
                  styleName: 'Title XL',
                  weight: 'W7',
                  style: AppTypography.titleXL(),
                  sampleText: 'フォントサンプル',
                ),
                _TypographyItem(
                  styleName: 'Title L',
                  weight: 'W7',
                  style: AppTypography.titleL(),
                  sampleText: 'フォントサンプル',
                ),
                _TypographyItem(
                  styleName: 'Title M',
                  weight: 'W7',
                  style: AppTypography.titleM(),
                  sampleText: 'フォントサンプル',
                ),
                _TypographyItem(
                  styleName: 'Title S',
                  weight: 'W7',
                  style: AppTypography.titleS(),
                  sampleText: 'フォントサンプル',
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Body Section
            _buildSection(
              title: 'Body',
              items: [
                _TypographyItem(
                  styleName: 'Body L',
                  weight: 'W4',
                  style: AppTypography.bodyLRegular(),
                  sampleText: 'フォントサンプル',
                  boldStyle: AppTypography.bodyLBold(),
                  boldWeight: 'W7',
                ),
                _TypographyItem(
                  styleName: 'Body M',
                  weight: 'W4',
                  style: AppTypography.bodyMRegular(),
                  sampleText: 'フォントサンプル',
                  boldStyle: AppTypography.bodyMBold(),
                  boldWeight: 'W7',
                ),
                _TypographyItem(
                  styleName: 'Body S',
                  weight: 'W4',
                  style: AppTypography.bodySRegular(),
                  sampleText: 'フォントサンプル',
                  boldStyle: AppTypography.bodySBold(),
                  boldWeight: 'W7',
                ),
                _TypographyItem(
                  styleName: 'Body XS',
                  weight: 'W4',
                  style: AppTypography.bodyXSRegular(),
                  sampleText: 'フォントサンプル',
                  boldStyle: AppTypography.bodyXSBold(),
                  boldWeight: 'W7',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSection({
    required String title,
    required List<_TypographyItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFE0E0E0),
              border: Border(
                bottom: BorderSide(color: Color(0xFFF5F5F5)),
              ),
            ),
            child: Text(
              title,
              style: AppTypography.titleL(color: const Color(0xFF1A1B21)),
            ),
          ),
          
          // Subheader
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5).withValues(alpha: 0.4),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Style name',
                    style: AppTypography.bodyMBold(
                      color: const Color(0xFFC5C6D0),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Weight',
                    style: AppTypography.bodyMBold(
                      color: const Color(0xFFC5C6D0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Items
          ...items.map((item) => _buildTableRow(item)),
        ],
      ),
    );
  }
  
  Widget _buildTableRow(_TypographyItem item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF5F5F5)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              item.styleName,
              style: AppTypography.bodyMBold(
                color: const Color(0xFF2F3036),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Text(
                        item.weight,
                        style: item.style,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      item.sampleText,
                      style: item.style,
                    ),
                  ],
                ),
                if (item.boldStyle != null && item.boldWeight != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Text(
                          item.boldWeight!,
                          style: item.boldStyle,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        item.sampleText,
                        style: item.boldStyle,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TypographyItem {
  final String styleName;
  final String weight;
  final TextStyle style;
  final String sampleText;
  final TextStyle? boldStyle;
  final String? boldWeight;
  
  const _TypographyItem({
    required this.styleName,
    required this.weight,
    required this.style,
    required this.sampleText,
    this.boldStyle,
    this.boldWeight,
  });
}