import '../data/topics_data.dart';
import '../models/topic.dart';

class SearchService {
  static List<MainTopic> searchTopics(String query) {
    if (query.isEmpty) return allTopics;
    
    final lowerQuery = query.toLowerCase();
    return allTopics
        .where((topic) =>
            topic.title.toLowerCase().contains(lowerQuery) ||
            topic.description.toLowerCase().contains(lowerQuery))
        .toList();
  }

  static List<SubTopic> searchSubTopics(String query) {
    if (query.isEmpty) return [];
    
    final lowerQuery = query.toLowerCase();
    final results = <SubTopic>[];
    
    for (final topic in allTopics) {
      for (final subTopic in topic.subTopics) {
        if (subTopic.title.toLowerCase().contains(lowerQuery) ||
            subTopic.theory.toLowerCase().contains(lowerQuery)) {
          results.add(subTopic);
        }
      }
    }
    
    return results;
  }

  static List<Example> searchExamples(String query) {
    if (query.isEmpty) return [];
    
    final lowerQuery = query.toLowerCase();
    final results = <Example>[];
    
    for (final topic in allTopics) {
      for (final subTopic in topic.subTopics) {
        for (final example in subTopic.examples) {
          if (example.title.toLowerCase().contains(lowerQuery) ||
              example.description.toLowerCase().contains(lowerQuery) ||
              example.solution.toLowerCase().contains(lowerQuery)) {
            results.add(example);
          }
        }
      }
    }
    
    return results;
  }

  static List<Problem> searchProblems(String query) {
    if (query.isEmpty) return [];
    
    final lowerQuery = query.toLowerCase();
    final results = <Problem>[];
    
    for (final topic in allTopics) {
      for (final subTopic in topic.subTopics) {
        for (final problem in subTopic.problems) {
          if (problem.title.toLowerCase().contains(lowerQuery) ||
              problem.description.toLowerCase().contains(lowerQuery)) {
            results.add(problem);
          }
        }
      }
    }
    
    return results;
  }
}
