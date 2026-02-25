import 'package:flutter/material.dart';

class MainTopic {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<SubTopic> subTopics;

  MainTopic({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.subTopics,
  });
}

class SubTopic {
  final String id;
  final String title;
  final String theory;
  final List<Example> examples;
  final List<Problem> problems;

  SubTopic({
    required this.id,
    required this.title,
    required this.theory,
    required this.examples,
    required this.problems,
  });
}

class Example {
  final String id;
  final String title;
  final String description;
  final String solution;

  Example({
    required this.id,
    required this.title,
    required this.description,
    required this.solution,
  });
}

class Problem {
  final String id;
  final String title;
  final String description;
  final String? answer;
  final String? hint;
  final String difficulty; // 'easy', 'medium', 'hard'

  Problem({
    required this.id,
    required this.title,
    required this.description,
    this.answer,
    this.hint,
    required this.difficulty,
  });
}
