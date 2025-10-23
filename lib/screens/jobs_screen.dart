import 'package:flutter/material.dart';
import '../widgets/info_card.dart';
import '../services/api_service.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(   // ✅ Correct generic type
        future: api.fetchJobs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // ✅ Fixed interpolation
          }

          final items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const Center(child: Text('No jobs available.'));
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
                  tag: 'Job',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
