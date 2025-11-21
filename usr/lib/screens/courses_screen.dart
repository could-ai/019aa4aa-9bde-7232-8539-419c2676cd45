import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/mock_data.dart';
import 'package:couldai_user_app/models/learning_model.dart';

class CoursesScreen extends StatelessWidget {
  final Function(Course) onCourseSelected;
  final String currentCourseId;

  const CoursesScreen({
    super.key,
    required this.onCourseSelected,
    required this.currentCourseId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explorar Cursos"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Grid responsivo: más columnas si la pantalla es ancha
          int crossAxisCount = constraints.maxWidth > 900 ? 4 : (constraints.maxWidth > 600 ? 3 : 2);
          
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemCount: MockData.courses.length,
            itemBuilder: (context, index) {
              final course = MockData.courses[index];
              final isSelected = course.id == currentCourseId;

              return _buildCourseCard(context, course, isSelected);
            },
          );
        },
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, Course course, bool isSelected) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isSelected 
            ? BorderSide(color: course.color, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: () => onCourseSelected(course),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: course.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      course.iconAsset,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                  if (isSelected)
                    Icon(Icons.check_circle, color: course.color),
                ],
              ),
              const Spacer(),
              Text(
                course.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                course.description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: 0.3, // Mock progress general del curso
                backgroundColor: Colors.grey[800],
                color: course.color,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 4),
              Text(
                "30% Completado",
                style: TextStyle(fontSize: 10, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
