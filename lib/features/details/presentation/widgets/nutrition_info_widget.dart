import 'dart:math';

import 'package:flutter/material.dart';

class NutritionInfoWidget extends StatelessWidget {
  final num calories;
  final num caloriesTotal;
  final num protein;
  final int proteinTotal;
  final num carbs;
  final int carbsTotal;
  final num fats;
  final int fatsTotal;

  const NutritionInfoWidget({
    super.key,
    required this.calories,
    required this.caloriesTotal,
    required this.protein,
    required this.proteinTotal,
    required this.carbs,
    required this.carbsTotal,
    required this.fats,
    required this.fatsTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _buildCircularIndicator(),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNutrientBar(
                  "PROTEIN",
                  protein,
                  proteinTotal,
                  const Color(0xFF76C638), // Greenish
                ),
                const SizedBox(height: 15),
                _buildNutrientBar(
                  "CARBS",
                  carbs,
                  carbsTotal,
                  const Color(0xFF261C78), // Orangish
                ),
                const SizedBox(height: 15),
                _buildNutrientBar(
                  "FATS",
                  fats,
                  fatsTotal,
                   Colors.redAccent, // Yellowish
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularIndicator() {
    return SizedBox(
      height: 120,
      width: 120,
      child: CustomPaint(
        painter: _CircularArcPainter(
          percentage: caloriesTotal > 0 ? calories / caloriesTotal : 0,
          color:  Colors.orange, // Deep Blue
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$calories",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const Text(
                "kcal",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutrientBar(
    String label,
    num value,
    int total,
    Color color,
  ) {
    double progress = total > 0 ? value / total : 0;
    progress = progress.clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              "${value}g",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 8,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth * progress,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CircularArcPainter extends CustomPainter {
  final double percentage;
  final Color color;

  _CircularArcPainter({required this.percentage, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - 5; // padding

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;
    
    double startAngle = -pi / 2; // Top
    double sweepAngle = 2 * pi * percentage; // Dynamic based on data
    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
