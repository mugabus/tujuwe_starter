import 'package:flutter/material.dart';
import '../widgets/info_card.dart';
import '../services/api_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: api.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const Center(child: Text('No news available.'));
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
                  tag: 'News',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
