import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userName = '🎓 Математик';
  String _userLevel = 'Новичок';
  int _streakDays = 12;
  int _solvedProblems = 247;
  int _totalPoints = 2470;
  double _accuracy = 87.5;
  String _selectedAvatar = '👨‍🎓';

  final List<String> _avatarOptions = [
    '👨‍🎓',
    '👩‍🎓',
    '🧑‍💻',
    '🤓',
    '👨‍🔬',
    '👩‍🔬',
    '🧠',
    '⭐',
    '🏆',
    '🚀',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
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
                      GestureDetector(
                        onTap: _showAvatarPicker,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                _selectedAvatar,
                                style: const TextStyle(fontSize: 60),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: _showEditNameDialog,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _userName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _userLevel,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: AppSpacing.md,
                  crossAxisSpacing: AppSpacing.md,
                  children: [
                    _buildStatCard(
                      title: 'Серия',
                      value: '$_streakDays',
                      icon: '🔥',
                      gradient: [const Color(0xFFF59E0B), const Color(0xFFDC2626)],
                    ),
                    _buildStatCard(
                      title: 'Решено',
                      value: '$_solvedProblems',
                      icon: '✅',
                      gradient: [AppColors.success, const Color(0xFF059669)],
                    ),
                    _buildStatCard(
                      title: 'Баллы',
                      value: '$_totalPoints',
                      icon: '🏆',
                      gradient: [AppColors.primary, const Color(0xFF8B5CF6)],
                    ),
                    _buildStatCard(
                      title: 'Точность',
                      value: '${_accuracy.toStringAsFixed(1)}%',
                      icon: '📊',
                      gradient: [const Color(0xFF06B6D4), const Color(0xFF0891B2)],
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  '📈 Прогресс по темам',
                  style: AppTextStyles.headingSmall,
                ),
                const SizedBox(height: AppSpacing.md),
                _buildProgressItem('Теория чисел', 45, 50),
                const SizedBox(height: AppSpacing.md),
                _buildProgressItem('Алгебра', 38, 50),
                const SizedBox(height: AppSpacing.md),
                _buildProgressItem('Планиметрия', 32, 45),
                const SizedBox(height: AppSpacing.md),
                _buildProgressItem('Комбинаторика', 28, 40),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  '🏅 Достижения',
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
                  child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                      _buildAchievementBadge('🌟', 'Новичок'),
                      _buildAchievementBadge('⭐', 'Практик'),
                      _buildAchievementBadge('🔥', '7 дней'),
                      _buildAchievementBadge('💯', 'Эксперт'),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, Color(0xFF8B5CF6)],
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('📚 Начните обучение!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          '🚀 Начать решение задач',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditNameDialog() {
    TextEditingController controller = TextEditingController(text: _userName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('✏️ Редактировать имя'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Введите ваше имя',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
            prefixIcon: const Icon(Icons.person),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Отмена')),
          ElevatedButton(
            onPressed: () {
              setState(() => _userName = controller.text.isEmpty ? '🎓 Математик' : controller.text);
              Navigator.pop(context);
            },
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('🎨 Выберите аватар', style: AppTextStyles.headingSmall),
            const SizedBox(height: AppSpacing.lg),
            GridView.count(
              crossAxisCount: 5,
              children: _avatarOptions.map((avatar) => 
                GestureDetector(
                  onTap: () {
                    setState(() => _selectedAvatar = avatar);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedAvatar == avatar ? AppColors.primary : Colors.transparent,
                        width: 3,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Text(avatar, style: const TextStyle(fontSize: 40))),
                  ),
                ),
              ).toList(),
            ),
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
        gradient: LinearGradient(colors: gradient),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: gradient[0].withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem(String title, int solved, int total) {
    double progress = solved / total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyles.bodyMedium),
            Text(
              '$solved/$total',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: AppColors.border,
            valueColor: AlwaysStoppedAnimation<Color>(
              progress > 0.7 ? AppColors.success : AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementBadge(String icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, Color(0xFF8B5CF6)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Center(
            child: Text(icon, style: const TextStyle(fontSize: 24)),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
