import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;

  const CustomProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final barHeight = 18.0;
          final radius = Radius.circular(7);
          final totalWidth = constraints.maxWidth;
          final starPosition = totalWidth * progress;

          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Background track
              Container(
                height: barHeight,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(radius),
                ),
              ),

              // Filled portion
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: barHeight,
                  decoration: BoxDecoration(
                    color: Color(0xFF5A55CA),
                    borderRadius: BorderRadius.all(radius),
                  ),
                ),
              ),

              // Star icon indicator
              Positioned(
                left: starPosition - 12,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Colors.black12,
                      )
                    ],
                  ),
                  child: Icon(Icons.star_rate_outlined,
                      size: 18, color: Color(0xFF5A55CA)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}