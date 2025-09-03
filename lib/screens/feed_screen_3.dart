import 'package:flutter/material.dart';
import '../theme/typography.dart';
import '../theme/color_system.dart';

/// Feed screen component
/// @figma-node-id: 128:1442
/// @figma-file: https://www.figma.com/design/aHUiDyN6X6uR4cPBNHJXDu/bull
/// @figma-component: Main
class FeedScreen3 extends StatelessWidget {
  const FeedScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Header with filter
            const _Header(),
            // Feed list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
                children: const [
                  _PostCard(
                    userName: 'ユーザー1',
                    timeAgo: '2時間前',
                    content: 'これは特別な投稿1です。重要なコンテンツとして強調表示されています。',
                    likeCount: 156,
                    commentCount: 23,
                    shareCount: 12,
                  ),
                  SizedBox(height: 24),
                  _PostCard(
                    userName: 'ユーザー2',
                    timeAgo: '1時間前',
                    content: 'これは特別な投稿1です。重要なコンテンツとして強調表示されています。',
                    likeCount: 120,
                    commentCount: 13,
                    shareCount: 6,
                  ),
                  SizedBox(height: 24),
                  _PostCard(
                    userName: 'ユーザー3',
                    timeAgo: '1時間前',
                    content: 'これは特別な投稿1です。重要なコンテンツとして強調表示されています。',
                    likeCount: 90,
                    commentCount: 10,
                    shareCount: 4,
                  ),
                ],
              ),
            ),
            // Bottom navigation
            const _BottomNavigation(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'フィルター',
            style: AppTypography.bodyMBold(color: colorScheme.onSurface),
          ),
          const SizedBox(width: 18),
          Icon(
            Icons.sort,
            size: 24,
            color: colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String content;
  final int likeCount;
  final int commentCount;
  final int shareCount;

  const _PostCard({
    Key? key,
    required this.userName,
    required this.timeAgo,
    required this.content,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: FigmaColors.neutral90.withOpacity(0.5),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info
          Row(
            children: [
              CircleAvatar(
                radius: 20.5,
                backgroundColor: FigmaColors.neutral90,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: AppTypography.bodyLBold(color: colorScheme.onSurface),
                  ),
                  Text(
                    timeAgo,
                    style: AppTypography.bodySRegular(color: colorScheme.onSurface),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Tag
          const _Tag(),
          const SizedBox(height: 16),
          // Content
          Text(
            content,
            style: AppTypography.bodyMBold(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 16),
          // Actions
          Row(
            children: [
              _ActionButton(
                icon: Icons.favorite,
                count: likeCount,
                color: FigmaColors.error60,
              ),
              const SizedBox(width: 24),
              _ActionButton(
                icon: Icons.chat_bubble_outline,
                count: commentCount,
                color: FigmaColors.neutralVariant50,
              ),
              const SizedBox(width: 24),
              _ActionButton(
                icon: Icons.upload,
                count: shareCount,
                color: FigmaColors.neutralVariant50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.onSurface,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.auto_awesome,
            size: 12,
            color: colorScheme.surface,
          ),
          const SizedBox(width: 4),
          Text(
            '注目',
            style: AppTypography.bodyXSBold(color: colorScheme.surface),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final int count;
  final Color color;

  const _ActionButton({
    Key? key,
    required this.icon,
    required this.count,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: color,
        ),
        const SizedBox(width: 3),
        Text(
          count.toString(),
          style: AppTypography.bodySBold(color: color),
        ),
      ],
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: FigmaColors.primary95,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC3C3C3).withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home,
            isSelected: true,
            color: FigmaColors.primary20,
          ),
          _NavItem(
            icon: Icons.search,
            isSelected: false,
            color: colorScheme.onSurface,
          ),
          _NavItem(
            icon: Icons.person,
            isSelected: false,
            color: colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Color color;

  const _NavItem({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          icon,
          size: 24,
          color: color,
        ),
        onPressed: () {},
      ),
    );
  }
}