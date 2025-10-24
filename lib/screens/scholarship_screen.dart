import 'package:flutter/material.dart';
import '../widgets/info_card.dart';
import '../services/api_service.dart';
import 'details_screen.dart';

class ScholarshipsScreen extends StatefulWidget {
  const ScholarshipsScreen({super.key});

  @override
  State<ScholarshipsScreen> createState() => _ScholarshipsScreenState();
}

class _ScholarshipsScreenState extends State<ScholarshipsScreen> {
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scholarships'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: api.fetchScholarships(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final items = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsScreen(item: item),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: InfoCard(
                    title: item['title'] ?? '',
                    subtitle: item['description'] ?? '',
                    imageUrl: item['image'] ?? '',
                    tag: 'Scholarship',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
