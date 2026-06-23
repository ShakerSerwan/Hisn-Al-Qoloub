import 'package:flutter/material.dart';

// Big Card
Widget buildBigCard(String title, IconData icon, Color color, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 18)),
            CircleAvatar(
              backgroundColor: color.withAlpha(50),
              child: Icon(icon, color: color),
            ),
          ],
        ),
      ),
    ),
  );
}

// Small Card
Widget buildSmallCard(String title, IconData icon, VoidCallback? onTap) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 30),
              const SizedBox(height: 10),
              Text(title),
            ],
          ),
        ),
      ),
    ),
  );
}