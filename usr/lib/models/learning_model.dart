import 'package:flutter/material.dart';

class Course {
  final String id;
  final String name;
  final String iconAsset; // Usaremos IconData para simplificar
  final String description;
  final Color color;
  final List<Module> modules;

  Course({
    required this.id,
    required this.name,
    required this.iconAsset,
    required this.description,
    required this.color,
    required this.modules,
  });
}

class Module {
  final String title;
  final String description;
  final bool isLocked;
  final double progress; // 0.0 a 1.0
  final List<Lesson> lessons;

  Module({
    required this.title,
    required this.description,
    this.isLocked = true,
    this.progress = 0.0,
    required this.lessons,
  });
}

class Lesson {
  final String title;
  final String content;

  Lesson({required this.title, required this.content});
}
