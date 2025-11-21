import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/learning_model.dart';

class MockData {
  static List<Course> courses = [
    Course(
      id: 'py',
      name: 'Python',
      iconAsset: '🐍',
      description: 'Desde scripts básicos hasta IA.',
      color: const Color(0xFFFFD54F),
      modules: [
        Module(
          title: 'Introducción a Python',
          description: 'Variables, tipos de datos y print().',
          isLocked: false,
          progress: 0.8,
          lessons: [],
        ),
        Module(
          title: 'Control de Flujo',
          description: 'If, else, y bucles for/while.',
          isLocked: false,
          progress: 0.3,
          lessons: [],
        ),
        Module(
          title: 'Funciones Avanzadas',
          description: 'Lambdas, decoradores y generadores.',
          isLocked: true,
          lessons: [],
        ),
        Module(
          title: 'Programación Orientada a Objetos',
          description: 'Clases, herencia y polimorfismo.',
          isLocked: true,
          lessons: [],
        ),
      ],
    ),
    Course(
      id: 'cpp',
      name: 'C++',
      iconAsset: '⚙️',
      description: 'Alto rendimiento y gestión de memoria.',
      color: const Color(0xFF5C6BC0),
      modules: [
        Module(
          title: 'Fundamentos de C++',
          description: 'Sintaxis básica y compilación.',
          isLocked: false,
          progress: 0.1,
          lessons: [],
        ),
        Module(
          title: 'Punteros y Referencias',
          description: 'Gestión directa de memoria.',
          isLocked: true,
          lessons: [],
        ),
      ],
    ),
    Course(
      id: 'css',
      name: 'CSS & Diseño',
      iconAsset: '🎨',
      description: 'Estilos, Flexbox y Grid.',
      color: const Color(0xFF29B6F6),
      modules: [
        Module(
          title: 'Selectores Básicos',
          description: 'Clases, IDs y etiquetas.',
          isLocked: false,
          progress: 1.0,
          lessons: [],
        ),
        Module(
          title: 'Flexbox Mastery',
          description: 'Diseños flexibles modernos.',
          isLocked: false,
          progress: 0.5,
          lessons: [],
        ),
      ],
    ),
    Course(
      id: 'js',
      name: 'JavaScript',
      iconAsset: '⚡',
      description: 'Interactividad web y lógica asíncrona.',
      color: const Color(0xFFFFEE58),
      modules: [],
    ),
    Course(
      id: 'dart',
      name: 'Dart & Flutter',
      iconAsset: '💙',
      description: 'Desarrollo multiplataforma.',
      color: const Color(0xFF42A5F5),
      modules: [],
    ),
  ];
}
