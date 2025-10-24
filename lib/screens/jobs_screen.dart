import 'package:flutter/material.dart';
import '../utils/laoder.dart';
import '../widgets/info_card.dart';
import '../services/api_service.dart';
import 'details_screen.dart';

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
     // will add some title and space
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: api.fetchJobs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: Loader());
          if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
          final items = snapshot.data ?? [];
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical:8),
                child: InfoCard(
                  title: item['title'] ?? '',
                  subtitle: item['description'] ?? '',
                  tag: 'Job',
                  imageUrl: item['image'] ?? '',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(item: item)));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
