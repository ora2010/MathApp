import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final List<Map<String, String>> _bookmarks = [
    {
      'title': 'НОД и НОК',
      'topic': 'Теория чисел',
      'difficulty': 'Средняя',
      'date': 'Сегодня',
    },
    {
      'title': 'Квадратные неравенства',
      'topic': 'Алгебра',
      'difficulty': 'Сложная',
      'date': 'Вчера',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📌 Закладки'),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: _bookmarks.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: _bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = _bookmarks[index];
                return _buildBookmarkCard(bookmark, index);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '📌',
            style: const TextStyle(fontSize: 60),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Нет закладок',
            style: AppTextStyles.headingSmall,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Сохраняйте интересные задачи\nи примеры для быстрого доступа',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBookmarkCard(Map<String, String> bookmark, int index) {
    Color difficultyColor = bookmark['difficulty'] == 'Легкая'
        ? AppColors.success
        : bookmark['difficulty'] == 'Средняя'
            ? Color(0xFFF59E0B)
            : Color(0xFFEF4444);

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookmark['title']!,
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        bookmark['topic']!,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: difficultyColor.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(AppRadius.sm),
                            ),
                            child: Text(
                              bookmark['difficulty']!,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: difficultyColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Text(
                            bookmark['date']!,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() => _bookmarks.removeAt(index));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Закладка удалена'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: AppColors.border),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to problem
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: const Text(
                  'Открыть задачу',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
