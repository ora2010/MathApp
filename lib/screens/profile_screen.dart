import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../screens/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userName = 'Ученик';
  int _level = 1;
  int _streakDays = 0;
  int _solvedProblems = 0;
  int _totalPoints = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    // TODO: Load from SharedPreferences or backend
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header with gradient
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.surface,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primary, Color(0xFF8B5CF6)],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Profile image
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            '👨‍🎓',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _userName,
                        style: AppTextStyles.headingMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Уровень $_level',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Stats grid
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Quick stats
                Row(
                  children: [
                    _buildStatCard(
                      icon: '🔥',
                      title: 'Серия',
                      value: '$_streakDays',
                      subtitle: 'дней подряд',
                      color: Color(0xFFFF6B6B),
                    ),
                    const SizedBox(width: 12),
                    _buildStatCard(
                      icon: '✅',
                      title: 'Решено',
                      value: '$_solvedProblems',
                      subtitle: 'задач',
                      color: AppColors.success,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildStatCard(
                      icon: '⭐',
                      title: 'Баллы',
                      value: '$_totalPoints',
                      subtitle: 'очков',
                      color: Color(0xFFFFC93C),
                    ),
                    const SizedBox(width: 12),
                    _buildStatCard(
                      icon: '🏆',
                      title: 'Ранг',
                      value: 'Новичок',
                      subtitle: 'ваш статус',
                      color: Color(0xFF9B59B6),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xl),
                // Progress sections
                _buildSectionTitle('Прогресс по темам'),
                const SizedBox(height: 12),
                _buildProgressItem(
                  title: 'Теория чисел',
                  progress: 0.6,
                  color: Color(0xFF6366F1),
                ),
                const SizedBox(height: 12),
                _buildProgressItem(
                  title: 'Алгебра',
                  progress: 0.4,
                  color: Color(0xFF8B5CF6),
                ),
                const SizedBox(height: 12),
                _buildProgressItem(
                  title: 'Геометрия',
                  progress: 0.2,
                  color: Color(0xFF10B981),
                ),
                const SizedBox(height: AppSpacing.xl),
                // Achievement section
                _buildSectionTitle('Достижения'),
                const SizedBox(height: 12),
                _buildAchievementGrid(),
                const SizedBox(height: AppSpacing.xl),
                // Action buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Начать обучение',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String icon,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: AppTextStyles.headingMedium.copyWith(
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppTextStyles.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressItem({
    required String title,
    required double progress,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.bodyLarge,
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: AppTextStyles.bodySmall.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: color.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.headingSmall,
    );
  }

  Widget _buildAchievementGrid() {
    final achievements = [
      {'icon': '🌟', 'title': 'Первый шаг'},
      {'icon': '🔥', 'title': '7 дней'},
      {'icon': '🎯', 'title': '10 задач'},
      {'icon': '⭐', 'title': '100 баллов'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        final achievement = achievements[index];
        return Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                achievement['icon'] as String,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                achievement['title'] as String,
                style: AppTextStyles.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
