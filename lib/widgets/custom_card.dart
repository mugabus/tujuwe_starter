import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Chip(
          label: Text(category),
          backgroundColor: Colors.teal.shade100,
        ),
      ),
    );
  }
}
