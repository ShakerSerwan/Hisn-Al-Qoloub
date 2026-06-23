import 'package:flutter/material.dart';

class DhikrCounterButton extends StatelessWidget {
  final int counter;
  final int total;
  final VoidCallback onTap;

  const DhikrCounterButton({
    super.key,
    required this.counter,
    required this.total,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (counter + 1) / total;
    final isFinished = (counter + 1) >= total;

    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: progress),
        duration: const Duration(milliseconds: 300),
        builder: (context, value, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // 🔵 الدائرة الخارجية (Progress)
              SizedBox(
                width: 110,
                height: 110,
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isFinished ? Colors.green : Colors.blue,
                  ),
                ),
              ),

              // 🔘 الزر الداخلي
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  color: isFinished ? Colors.green : Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(40),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "${counter + 1}/$total",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}