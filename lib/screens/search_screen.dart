import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/topic.dart';
import '../services/search_service.dart';
import '../widgets/custom_widgets.dart';
import 'topic_detail_screen.dart';
import 'subtopic_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<MainTopic> topicsResults = [];
  List<SubTopic> subTopicsResults = [];
  List<Example> examplesResults = [];
  List<Problem> problemsResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      topicsResults = SearchService.searchTopics(query);
      subTopicsResults = SearchService.searchSubTopics(query);
      examplesResults = SearchService.searchExamples(query);
      problemsResults = SearchService.searchProblems(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasResults = topicsResults.isNotEmpty ||
        subTopicsResults.isNotEmpty ||
        examplesResults.isNotEmpty ||
        problemsResults.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Search bar
          Container(
            color: AppColors.surface,
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: SafeArea(
              bottom: false,
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Поиск по темам, формулам...',
                  hintStyle: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.primary,
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            _searchController.clear();
                            _onSearchChanged('');
                          },
                          child: const Icon(
                            Icons.clear,
                            color: AppColors.textSecondary,
                          ),
                        )
                      : null,
                  filled: true,
                  fillColor: AppColors.primaryLight.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.md,
                  ),
                ),
              ),
            ),
          ),
          // Results
          Expanded(
            child: _searchController.text.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          size: 64,
                          color: AppColors.textSecondary.withOpacity(0.5),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Text(
                          'Начните поиск',
                          style: AppTextStyles.headingMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'Введите запрос для поиска тем и задач',
                          style: AppTextStyles.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : !hasResults
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.not_interested_rounded,
                              size: 64,
                              color: AppColors.textSecondary.withOpacity(0.5),
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            Text(
                              'Ничего не найдено',
                              style: AppTextStyles.headingMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              'Попробуйте другой запрос',
                              style: AppTextStyles.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (topicsResults.isNotEmpty) ...[
                              SectionHeader(
                                title: 'Основные темы (${topicsResults.length})',
                              ),
                              const SizedBox(height: AppSpacing.md),
                              ...topicsResults.map((topic) => Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: AppSpacing.md),
                                    child: TopicCard(
                                      title: topic.title,
                                      description: topic.description,
                                      icon: topic.icon,
                                      color: topic.color,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SubTopicListScreen(
                                              mainTopic: topic,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )),
                              const SizedBox(height: AppSpacing.lg),
                            ],
                            if (subTopicsResults.isNotEmpty) ...[
                              SectionHeader(
                                title: 'Подтемы (${subTopicsResults.length})',
                              ),
                              const SizedBox(height: AppSpacing.md),
                              ...subTopicsResults.map((subTopic) => Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: AppSpacing.md),
                                    child: SubTopicButton(
                                      title: subTopic.title,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TopicDetailScreen(
                                              subTopic: subTopic,
                                              mainTopicColor: AppColors.primary,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )),
                              const SizedBox(height: AppSpacing.lg),
                            ],
                            if (examplesResults.isNotEmpty) ...[
                              SectionHeader(
                                title: 'Примеры (${examplesResults.length})',
                              ),
                              const SizedBox(height: AppSpacing.md),
                              ...examplesResults.map((example) => Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: AppSpacing.md),
                                    child: ExampleCard(
                                      title: example.title,
                                      description: example.description,
                                      solution: example.solution,
                                    ),
                                  )),
                              const SizedBox(height: AppSpacing.lg),
                            ],
                            if (problemsResults.isNotEmpty) ...[
                              SectionHeader(
                                title: 'Задачи (${problemsResults.length})',
                              ),
                              const SizedBox(height: AppSpacing.md),
                              ...problemsResults.map((problem) => Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: AppSpacing.md),
                                    child: ProblemCard(
                                      title: problem.title,
                                      description: problem.description,
                                      answer: problem.answer,
                                      hint: problem.hint,
                                      difficulty: problem.difficulty,
                                    ),
                                  )),
                            ],
                          ],
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
