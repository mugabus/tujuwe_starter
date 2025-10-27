import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  const DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item['type'] ?? 'Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (item['image'] != null && item['image'] != '') Image.network(item['image'], height:220, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item['title'] ?? '', style: const TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
                const SizedBox(height:8),
                Text(item['description'] ?? '', style: const TextStyle(fontSize:16)),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
