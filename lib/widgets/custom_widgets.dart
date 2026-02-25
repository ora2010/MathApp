import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class TopicCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const TopicCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(0.1),
              color.withOpacity(0.05),
            ],
          ),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Flexible(
                child: Text(
                  title,
                  style: AppTextStyles.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Text(
                  description,
                  style: AppTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubTopicButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SubTopicButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.bodyMedium,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewMore;

  const SectionHeader({
    super.key,
    required this.title,
    this.onViewMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.headingMedium,
          ),
          if (onViewMore != null)
            GestureDetector(
              onTap: onViewMore,
              child: const Text(
                'Подробнее',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class TheoryCard extends StatelessWidget {
  final String theory;

  const TheoryCard({
    super.key,
    required this.theory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryLight.withOpacity(0.5),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          width: 1,
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
                Icons.lightbulb_outline,
                color: AppColors.primary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Теория',
                style: AppTextStyles.headingSmall.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            theory,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.text,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleCard extends StatelessWidget {
  final String title;
  final String description;
  final String solution;

  const ExampleCard({
    super.key,
    required this.title,
    required this.description,
    required this.solution,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: const Icon(
                  Icons.check_circle_outline,
                  color: Color(0xFF10B981),
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.headingSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Задача:',
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.text,
              height: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Решение:',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF10B981),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  solution,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.text,
                    fontFamily: 'Courier',
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProblemCard extends StatefulWidget {
  final String title;
  final String description;
  final String? answer;
  final String? hint;
  final String difficulty;

  const ProblemCard({
    super.key,
    required this.title,
    required this.description,
    this.answer,
    this.hint,
    required this.difficulty,
  });

  @override
  State<ProblemCard> createState() => _ProblemCardState();
}

class _ProblemCardState extends State<ProblemCard> {
  bool showAnswer = false;
  bool showHint = false;

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty) {
      case 'easy':
        return const Color(0xFF10B981);
      case 'medium':
        return const Color(0xFFF59E0B);
      case 'hard':
        return const Color(0xFFEF4444);
      default:
        return AppColors.textSecondary;
    }
  }

  String _getDifficultyLabel(String difficulty) {
    switch (difficulty) {
      case 'easy':
        return 'Легко';
      case 'medium':
        return 'Средне';
      case 'hard':
        return 'Сложно';
      default:
        return difficulty;
    }
  }

  @override
  Widget build(BuildContext context) {
    final diffColor = _getDifficultyColor(widget.difficulty);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: AppTextStyles.headingSmall,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: diffColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                child: Text(
                  _getDifficultyLabel(widget.difficulty),
                  style: AppTextStyles.captionMedium.copyWith(
                    color: diffColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            widget.description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.text,
              height: 1.6,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              if (widget.hint != null)
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showHint = !showHint),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF59E0B).withOpacity(0.1),
                        border: Border.all(
                          color: const Color(0xFFF59E0B).withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.help_outline,
                            size: 16,
                            color: Color(0xFFF59E0B),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            'Подсказка',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: const Color(0xFFF59E0B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (widget.hint != null && widget.answer != null)
                const SizedBox(width: AppSpacing.md),
              if (widget.answer != null)
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showAnswer = !showAnswer),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withOpacity(0.1),
                        border: Border.all(
                          color: const Color(0xFF10B981).withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.visibility_outlined,
                            size: 16,
                            color: Color(0xFF10B981),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            'Ответ',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: const Color(0xFF10B981),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (showHint && widget.hint != null) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF59E0B).withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                widget.hint!,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.text,
                  height: 1.5,
                ),
              ),
            ),
          ],
          if (showAnswer && widget.answer != null) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF10B981).withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ответ:',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF10B981),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    widget.answer!,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.text,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Courier',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.backgroundColor = AppColors.surface,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              if (showBackButton)
                GestureDetector(
                  onTap: onBackPressed ?? () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: AppColors.text,
                  ),
                ),
              if (showBackButton) const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.headingMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
