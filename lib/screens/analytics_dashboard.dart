import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AnalyticsDashboard extends StatefulWidget {
  const AnalyticsDashboard({super.key});

  @override
  State<AnalyticsDashboard> createState() => _AnalyticsDashboardState();
}

class _AnalyticsDashboardState extends State<AnalyticsDashboard> {
  // Dummy data - в будущем будет из API/БД
  int _totalSolved = 247;
  int _todaySolved = 5;
  int _totalPoints = 2470;
  int _streak = 12;
  double _accuracy = 87.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📊 Аналитика'),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main stats grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              children: [
                _buildStatCard(
                  title: 'Решено всего',
                  value: '$_totalSolved',
                  icon: '✅',
                  gradient: [AppColors.success, Color(0xFF059669)],
                ),
                _buildStatCard(
                  title: 'Сегодня',
                  value: '$_todaySolved',
                  icon: '🔥',
                  gradient: [Color(0xFFF59E0B), Color(0xFFDC2626)],
                ),
                _buildStatCard(
                  title: 'Очков',
                  value: '$_totalPoints',
                  icon: '🏆',
                  gradient: [AppColors.primary, Color(0xFF8B5CF6)],
                ),
                _buildStatCard(
                  title: 'Серия',
                  value: '$_streak дн.',
                  icon: '⭐',
                  gradient: [Color(0xFFEC4899), Color(0xFF8B5CF6)],
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            // Accuracy section
            Text(
              'Точность решений',
              style: AppTextStyles.headingSmall,
            ),
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Процент правильных ответов',
                        style: AppTextStyles.bodyLarge,
                      ),
                      Text(
                        '${_accuracy.toStringAsFixed(1)}%',
                        style: AppTextStyles.headingSmall.copyWith(
                          color: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: _accuracy / 100,
                      minHeight: 8,
                      backgroundColor: AppColors.primary.withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _accuracy >= 80
                            ? AppColors.success
                            : _accuracy >= 60
                                ? Color(0xFFF59E0B)
                                : Color(0xFFFF6B6B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            // Weekly stats
            Text(
              'Активность по дням',
              style: AppTextStyles.headingSmall,
            ),
            const SizedBox(height: AppSpacing.md),
            _buildWeeklyStats(),
            const SizedBox(height: AppSpacing.xl),
            // Topic progress
            Text(
              'Прогресс по темам',
              style: AppTextStyles.headingSmall,
            ),
            const SizedBox(height: AppSpacing.md),
            _buildTopicProgress('Теория чисел', 45, 50),
            const SizedBox(height: AppSpacing.md),
            _buildTopicProgress('Алгебра', 38, 50),
            const SizedBox(height: AppSpacing.md),
            _buildTopicProgress('Планиметрия', 32, 45),
            const SizedBox(height: AppSpacing.md),
            _buildTopicProgress('Комбинаторика', 28, 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String icon,
    required List<Color> gradient,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: gradient[0].withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      icon,
                      style: const TextStyle(fontSize: 32),
                    ),
                    Icon(
                      Icons.trending_up,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: AppTextStyles.headingSmall.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeeklyStats() {
    final days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    final values = [3, 5, 2, 4, 6, 7, 5];
    final maxValue = values.reduce((a, b) => a > b ? a : b).toDouble();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                days.length,
                (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 30,
                      height: (values[index] / maxValue) * 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary,
                            AppColors.primary.withOpacity(0.5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      days[index],
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Divider(color: AppColors.border),
          const SizedBox(height: 8),
          Text(
            'Сумма на неделю: ${values.reduce((a, b) => a + b)} задач',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTopicProgress(String topic, int solved, int total) {
    final percent = (solved / total * 100).toStringAsFixed(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              topic,
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '$solved/$total ($percent%)',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: solved / total,
            minHeight: 6,
            backgroundColor: AppColors.primary.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.success),
          ),
        ),
      ],
    );
  }
}
