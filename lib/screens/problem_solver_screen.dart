import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/topic.dart';

class ProblemSolverScreen extends StatefulWidget {
  final SubTopic subTopic;

  const ProblemSolverScreen({required this.subTopic, super.key});

  @override
  State<ProblemSolverScreen> createState() => _ProblemSolverScreenState();
}

class _ProblemSolverScreenState extends State<ProblemSolverScreen> {
  int _solvedCount = 0;
  int _currentProblemIndex = 0;
  bool _showHint = false;
  bool _showAnswer = false;
  bool _isSolved = false;

  @override
  Widget build(BuildContext context) {
    final problems = widget.subTopic.problems;
    if (problems.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Решение задач')),
        body: const Center(child: Text('Нет задач')),
      );
    }

    final currentProblem = problems[_currentProblemIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subTopic.title),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$_solvedCount/${problems.length}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Problem number
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Text(
                'Задача ${_currentProblemIndex + 1}',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            // Problem title
            Text(
              currentProblem.title,
              style: AppTextStyles.headingSmall,
            ),
            const SizedBox(height: AppSpacing.md),
            // Problem description
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: AppColors.border),
              ),
              child: Text(
                currentProblem.description,
                style: AppTextStyles.bodyLarge.copyWith(
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            // Hint section
            if (currentProblem.hint != null) ...[
              _buildCollapsibleSection(
                title: '💡 Подсказка',
                content: currentProblem.hint!,
                isExpanded: _showHint,
                onTap: () => setState(() => _showHint = !_showHint),
                color: Color(0xFFF59E0B),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
            // Answer section
            if (currentProblem.answer != null) ...[
              _buildCollapsibleSection(
                title: '✅ Решение',
                content: currentProblem.answer!,
                isExpanded: _showAnswer,
                onTap: () => setState(() => _showAnswer = !_showAnswer),
                color: AppColors.success,
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
            // Main action button - "Решил"
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.success, Color(0xFF059669)],
                ),
                borderRadius: BorderRadius.circular(AppRadius.lg),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _handleProblemSolved,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.lg,
                    ),
                    child: Column(
                      children: [
                        Text(
                          _isSolved ? '✅ Задача отмечена как решённая!' : '🎯 Я решил эту задачу',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if (!_isSolved) ...[
                          const SizedBox(height: 4),
                          Text(
                            'Нажмите для подтверждения',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            // Navigation buttons
            Row(
              children: [
                if (_currentProblemIndex > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _currentProblemIndex--;
                          _showHint = false;
                          _showAnswer = false;
                          _isSolved = false;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('← Предыдущая'),
                    ),
                  ),
                if (_currentProblemIndex > 0) const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _currentProblemIndex < problems.length - 1
                        ? () {
                            setState(() {
                              _currentProblemIndex++;
                              _showHint = false;
                              _showAnswer = false;
                              _isSolved = false;
                            });
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      _currentProblemIndex == problems.length - 1
                          ? '✅ Всё решено!'
                          : 'Следующая →',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsibleSection({
    required String title,
    required String content,
    required bool isExpanded,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          border: Border.all(color: color.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.expand_more,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            if (isExpanded) ...[
              Divider(height: 1, color: color.withOpacity(0.2)),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Text(
                  content,
                  style: AppTextStyles.bodyLarge.copyWith(
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _handleProblemSolved() {
    if (_isSolved) return;

    setState(() {
      _isSolved = true;
      _solvedCount++;
    });

    // Show celebration animation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🎉 Поздравляем!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Задача решена правильно!'),
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Text(
                '+10 баллов 🏆',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.success,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Спасибо!'),
          ),
        ],
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _isSolved = false);
      }
    });
  }
}
