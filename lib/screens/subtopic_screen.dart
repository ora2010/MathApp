import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/topic.dart';
import '../widgets/custom_widgets.dart';
import 'topic_detail_screen.dart';

class SubTopicListScreen extends StatelessWidget {
  final MainTopic mainTopic;

  const SubTopicListScreen({
    super.key,
    required this.mainTopic,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: mainTopic.title,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: mainTopic.color.withOpacity(0.1),
                border: Border.all(
                  color: mainTopic.color.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(AppRadius.lg),
              ),
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: mainTopic.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Icon(
                      mainTopic.icon,
                      color: mainTopic.color,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mainTopic.title,
                          style: AppTextStyles.headingMedium.copyWith(
                            color: mainTopic.color,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          mainTopic.description,
                          style: AppTextStyles.bodySmall,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            SectionHeader(
              title: 'Разделы',
            ),
            const SizedBox(height: AppSpacing.md),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mainTopic.subTopics.length,
              itemBuilder: (context, index) {
                final subTopic = mainTopic.subTopics[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: SubTopicButton(
                    title: subTopic.title,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TopicDetailScreen(
                            subTopic: subTopic,
                            mainTopicColor: mainTopic.color,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
