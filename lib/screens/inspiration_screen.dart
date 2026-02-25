import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class InspirationScreen extends StatelessWidget {
  const InspirationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inspirations = [
      {
        'title': '🧮 Почему математика лучше?',
        'items': [
          'Развивает логическое мышление 🧠',
          'Открывает двери в лучшие университеты 🎓',
          'Повышает решение проблем 💡',
          'Требуется в технологии и науке 🚀',
          'Дает конкурентное преимущество 🏆',
        ],
      },
      {
        'title': '✨ Мотивация и вдохновение',
        'items': [
          'Каждая задача - это новый вызов 🎯',
          'Ты становишься умнее каждый день 📈',
          'Олимпиады открывают возможности 🌟',
          'Успех требует практики 💪',
          'Верь в себя - ты сможешь 🔥',
        ],
      },
      {
        'title': '🏅 Путь ОлимпиЖника',
        'items': [
          'Начни с теории 📚',
          'Разбери примеры с решениями 🔍',
          'Реши практические задачи ✍️',
          'Улучшай свои навыки 📊',
          'Достигни вершины 🚀',
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Вдохновение'),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.lg),
        itemCount: inspirations.length,
        itemBuilder: (context, index) {
          final inspiration = inspirations[index];
          return Column(
            children: [
              _buildInspirationCard(
                title: inspiration['title'] as String,
                items: inspiration['items'] as List<String>,
              ),
              if (index < inspirations.length - 1)
                const SizedBox(height: AppSpacing.lg),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInspirationCard({
    required String title,
    required List<String> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, Color(0xFF8B5CF6)],
              ),
            ),
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Text(
              title,
              style: AppTextStyles.headingSmall.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          ...items.asMap().entries.map(
            (entry) {
              final isLast = entry.key == items.length - 1;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text(
                              '${entry.key + 1}',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            entry.value,
                            style: AppTextStyles.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    Divider(
                      height: 1,
                      color: AppColors.border,
                      indent: 56,
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
