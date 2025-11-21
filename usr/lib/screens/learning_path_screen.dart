import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/learning_model.dart';
import 'package:couldai_user_app/screens/lesson_screen.dart';

class LearningPathScreen extends StatelessWidget {
  final Course course;

  const LearningPathScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(course.iconAsset, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 10),
            Text(course.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.redAccent),
            ),
            child: const Row(
              children: [
                Icon(Icons.local_fire_department, color: Colors.redAccent, size: 20),
                SizedBox(width: 4),
                Text("12", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        itemCount: course.modules.length,
        itemBuilder: (context, index) {
          final module = course.modules[index];
          // Alternar alineación para efecto de "camino" serpenteante
          final isLeft = index % 2 == 0; 
          
          return _buildModuleNode(context, module, index, isLeft, course.color);
        },
      ),
    );
  }

  Widget _buildModuleNode(BuildContext context, Module module, int index, bool isLeft, Color courseColor) {
    return Column(
      children: [
        // Línea conectora (si no es el primero)
        if (index > 0)
          Container(
            height: 40,
            width: 4,
            color: Colors.grey.withOpacity(0.3),
            margin: EdgeInsets.only(
              bottom: 10, 
              // Ajuste sutil para que parezca conectado, en una app real usaríamos CustomPainter para curvas
            ),
          ),
        
        GestureDetector(
          onTap: () {
            if (!module.isLocked) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LessonScreen(module: module)),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Completa los módulos anteriores para desbloquear este.")),
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              left: isLeft ? 0 : 60,
              right: isLeft ? 60 : 0,
              bottom: 10,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // El nodo circular principal
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: module.isLocked ? const Color(0xFF2C2C2C) : courseColor,
                    boxShadow: module.isLocked ? [] : [
                      BoxShadow(
                        color: courseColor.withOpacity(0.5),
                        blurRadius: 15,
                        spreadRadius: 2,
                      )
                    ],
                    border: Border.all(
                      color: module.isLocked ? Colors.grey : Colors.white,
                      width: module.isLocked ? 2 : 4,
                    ),
                  ),
                  child: Icon(
                    module.isLocked ? Icons.lock : Icons.star,
                    size: 32,
                    color: module.isLocked ? Colors.grey : Colors.black,
                  ),
                ),
                // Indicador de progreso circular
                if (!module.isLocked && module.progress < 1.0)
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: CircularProgressIndicator(
                      value: module.progress,
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          module.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: module.isLocked ? Colors.grey : Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          module.description,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[500],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
