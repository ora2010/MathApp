import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/topic.dart';
import '../widgets/custom_widgets.dart';
import 'problem_solver_screen.dart';

class TopicDetailScreen extends StatefulWidget {
  final SubTopic subTopic;
  final Color mainTopicColor;

  const TopicDetailScreen({
    super.key,
    required this.subTopic,
    required this.mainTopicColor,
  });

  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: widget.subTopic.title,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab selector
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  _buildTabButton('Теория', 0),
                  _buildTabButton('Примеры', 1),
                  _buildTabButton('Задачи', 2),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            // Content based on selected tab
            if (_currentPage == 0)
              _buildTheorySection()
            else if (_currentPage == 1)
              _buildExamplesSection()
            else
              _buildProblemsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = _currentPage == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _currentPage = index),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? widget.mainTopicColor.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                color:
                    isSelected ? widget.mainTopicColor : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTheorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TheoryCard(theory: widget.subTopic.theory),
        const SizedBox(height: AppSpacing.lg),
        // Additional theory tips
        Container(
          decoration: BoxDecoration(
            color: widget.mainTopicColor.withOpacity(0.05),
            border: Border.all(
              color: widget.mainTopicColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_outline,
                    color: widget.mainTopicColor,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Важные моменты',
                    style: AppTextStyles.headingSmall.copyWith(
                      color: widget.mainTopicColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                '• Внимательно прочитайте теорию\n'
                '• Разберите примеры решений\n'
                '• Попробуйте решить задачи самостоятельно\n'
                '• Проверьте ответы',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.text,
                  height: 1.8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExamplesSection() {
    if (widget.subTopic.examples.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
          child: Text(
            'Примеры еще не добавлены',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        widget.subTopic.examples.length,
        (index) {
          final example = widget.subTopic.examples[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            child: ExampleCard(
              title: example.title,
              description: example.description,
              solution: example.solution,
            ),
          );
        },
      ),
    );
  }

  Widget _buildProblemsSection() {
    if (widget.subTopic.problems.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
          child: Text(
            'Задачи еще не добавлены',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Button to start solving problems
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, Color(0xFF8B5CF6)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProblemSolverScreen(subTopic: widget.subTopic),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(AppRadius.lg),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.lg,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.play_arrow, color: Colors.white),
                    const SizedBox(width: AppSpacing.md),
                    Text(
                      'Начать решение (${widget.subTopic.problems.length} задач)',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Все задачи:',
          style: AppTextStyles.headingSmall,
        ),
        const SizedBox(height: AppSpacing.md),
        // List of all problems for preview
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.subTopic.problems.length,
          itemBuilder: (context, index) {
            final problem = widget.subTopic.problems[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: widget.mainTopicColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: widget.mainTopicColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            problem.title,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: _getDifficultyColor(problem.difficulty)
                                      .withOpacity(0.1),
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.sm),
                                ),
                                child: Text(
                                  problem.difficulty,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: _getDifficultyColor(
                                        problem.difficulty),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'легко':
        return AppColors.success;
      case 'средне':
        return Color(0xFFF59E0B);
      case 'сложно':
        return Color(0xFFFF6B6B);
      default:
        return AppColors.primary;
    }
  }
}
