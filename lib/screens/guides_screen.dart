import 'package:flutter/material.dart';
import '../widgets/info_card.dart';
import '../services/api_service.dart';
import '../utils/laoder.dart';

class GuidesScreen extends StatefulWidget {
  const GuidesScreen({super.key});

  @override
  State<GuidesScreen> createState() => _GuidesScreenState();
}

class _GuidesScreenState extends State<GuidesScreen> {
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guides'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(   // ✅ FIXED generic type
        future: api.fetchGuides(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Laoder());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // ✅ FIXED interpolation
          }

          final items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const Center(child: Text('No guides available.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: InfoCard(
                  title: item['title'] ?? 'Untitled',
                  subtitle: item['description'] ?? 'No description provided.',
                  tag: 'Guide',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
