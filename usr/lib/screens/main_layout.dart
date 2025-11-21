import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/learning_path_screen.dart';
import 'package:couldai_user_app/screens/courses_screen.dart';
import 'package:couldai_user_app/data/mock_data.dart';
import 'package:couldai_user_app/models/learning_model.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  Course _currentCourse = MockData.courses[0]; // Curso seleccionado por defecto (Python)

  void _onCourseSelected(Course course) {
    setState(() {
      _currentCourse = course;
      _selectedIndex = 0; // Volver a la ruta de aprendizaje
    });
  }

  @override
  Widget build(BuildContext context) {
    // Usamos LayoutBuilder para determinar si es móvil o escritorio
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 800;

        final List<Widget> screens = [
          LearningPathScreen(course: _currentCourse),
          CoursesScreen(
            onCourseSelected: _onCourseSelected,
            currentCourseId: _currentCourse.id,
          ),
          const Center(child: Text("Perfil y Estadísticas (Próximamente)")),
        ];

        if (isDesktop) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  backgroundColor: const Color(0xFF121212),
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  leading: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      backgroundColor: _currentCourse.color,
                      child: Text(_currentCourse.iconAsset),
                    ),
                  ),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.map_outlined),
                      selectedIcon: Icon(Icons.map),
                      label: Text('Ruta'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.grid_view_outlined),
                      selectedIcon: Icon(Icons.grid_view),
                      label: Text('Cursos'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: Text('Perfil'),
                    ),
                  ],
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: screens[_selectedIndex],
                ),
              ],
            ),
          );
        } else {
          // Diseño Móvil
          return Scaffold(
            body: screens[_selectedIndex],
            bottomNavigationBar: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.map_outlined),
                  selectedIcon: Icon(Icons.map),
                  label: 'Ruta',
                ),
                NavigationDestination(
                  icon: Icon(Icons.grid_view_outlined),
                  selectedIcon: Icon(Icons.grid_view),
                  label: 'Cursos',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'Perfil',
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
