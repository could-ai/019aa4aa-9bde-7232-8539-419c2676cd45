import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/learning_model.dart';

class LessonScreen extends StatefulWidget {
  final Module module;

  const LessonScreen({super.key, required this.module});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.module.title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: (_currentStep + 1) / 5, // Simulación de 5 pasos
            backgroundColor: Colors.grey[800],
            color: Colors.greenAccent,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Pregunta 1 de 5",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "¿Cuál es la salida del siguiente código?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: const Text(
                "print('Hola Mundo')",
                style: TextStyle(
                  fontFamily: 'Courier New',
                  fontSize: 16,
                  color: Colors.greenAccent,
                ),
              ),
            ),
            const Spacer(),
            _buildOption("Hola Mundo", true),
            const SizedBox(height: 12),
            _buildOption("Error de sintaxis", false),
            const SizedBox(height: 12),
            _buildOption("print('Hola Mundo')", false),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_currentStep < 4) {
                  setState(() {
                    _currentStep++;
                  });
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("¡Lección completada! +50 XP")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Text(_currentStep < 4 ? "COMPROBAR" : "FINALIZAR"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String text, bool isCorrect) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        side: BorderSide(color: Colors.grey.withOpacity(0.5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        alignment: Alignment.centerLeft,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
