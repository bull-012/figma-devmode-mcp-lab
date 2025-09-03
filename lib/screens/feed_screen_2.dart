import 'package:flutter/material.dart';
import '../theme/typography.dart';

/// Feed screen
/// @figma-node-id: 128:2017
/// @figma-file: https://www.figma.com/design/aHUiDyN6X6uR4cPBNHJXDu/bull
/// @figma-component: Main
class FeedScreen2 extends StatelessWidget {
  const FeedScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const _FilterHeader(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: const [
                      SizedBox(height: 8),
                      _PostCard(
                        userName: 'ユーザー1',
                        timeAgo: '2時間前',
                        likes: 156,
                        comments: 23,
                        shares: 12,
                      ),
                      SizedBox(height: 24),
                      _PostCard(
                        userName: 'ユーザー2',
                        timeAgo: '1時間前',
                        likes: 120,
                        comments: 13,
                        shares: 6,
                      ),
                      SizedBox(height: 24),
                      _PostCard(
                        userName: 'ユーザー3',
                        timeAgo: '1時間前',
                        likes: 90,
                        comments: 10,
                        shares: 4,
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _NavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'フィルター',
            style: AppTypography.bodyMBold(color: colorScheme.onSurface),
          ),
          const SizedBox(width: 12),
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
  final int likes;
  final int comments;
  final int shares;
  
  const _PostCard({
    super.key,
    required this.userName,
    required this.timeAgo,
    required this.likes,
    required this.comments,
    required this.shares,
  });

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
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.5,
                backgroundColor: colorScheme.surfaceContainerHighest,
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
          const SizedBox(height: 4),
          const _FeaturedTag(),
          const SizedBox(height: 12),
          Text(
            'これは特別な投稿1です。重要なコンテンツとして強調表示されています。',
            style: AppTypography.bodyMBold(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _ActionButton(
                icon: Icons.favorite,
                count: likes,
                color: colorScheme.error,
              ),
              const SizedBox(width: 20),
              _ActionButton(
                icon: Icons.chat_bubble_outline,
                count: comments,
                color: colorScheme.outline,
              ),
              const SizedBox(width: 20),
              _ActionButton(
                icon: Icons.upload,
                count: shares,
                color: colorScheme.outline,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeaturedTag extends StatelessWidget {
  const _FeaturedTag({super.key});

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
            color: colorScheme.onPrimary,
          ),
          const SizedBox(width: 4),
          Text(
            '注目',
            style: AppTypography.bodyXSBold(color: colorScheme.onPrimary),
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
    super.key,
    required this.icon,
    required this.count,
    required this.color,
  });

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

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorScheme.outline.withValues(alpha: 0.25),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              size: 24,
              color: colorScheme.onPrimaryContainer,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 24,
              color: colorScheme.onSurface,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              size: 24,
              color: colorScheme.onSurface,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}