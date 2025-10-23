import 'package:flutter/material.dart';
import '../widgets/info_card.dart';
import '../services/api_service.dart';

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
        
        title: const Center(
          child: Text("Tujuwe"),
        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>( // ✅ specify type
        future: api.fetchCombinedFeed(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final items = snapshot.data ?? [];

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Latest from organizations and community',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: InfoCard(
                        title: item['title'] ?? '',
                        subtitle: item['description'] ?? '',
                        tag: item['type'] ?? 'Info',
                      ),
                    );
                  },
                  childCount: items.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
