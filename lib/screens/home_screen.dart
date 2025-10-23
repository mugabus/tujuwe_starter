import 'package:flutter/material.dart';
import '../utils/laoder.dart';
import '../widgets/info_card.dart';
import '../services/api_service.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService api = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TUJUWE'),
        backgroundColor: const Color(0xFF0D47A1),
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: api.fetchCombinedFeed(),
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
                  tag: item['type'] ?? 'Info',
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
