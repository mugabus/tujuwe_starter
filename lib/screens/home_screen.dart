import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/news_card.dart';
import '../widgets/grid_card.dart';
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
      // i will add some space here
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: api.fetchCombinedFeed(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final items = snapshot.data ?? [];

          // Separate some data types for better layout
          final newsItems = items.where((i) => i['type'] == 'News').toList();
          final otherItems = items.where((i) => i['type'] != 'News').toList();

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to TUJUWE',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Get the latest updates, opportunities, and guidance for refugees.',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 20),

                  // Featured news horizontal list
                  const Text(
                    'Featured News',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newsItems.length,
                      itemBuilder: (context, index) {
                        final item = newsItems[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsScreen(item: item),
                            ),
                          ),
                          child: NewsCard(
                            title: item['title'] ?? '',
                            imageUrl: item['image'] ?? '',
                            tag: item['type'] ?? '',
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Grid for Jobs and Guides
                  const Text(
                    'Jobs & Guides',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: otherItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      final item = otherItems[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsScreen(item: item),
                          ),
                        ),
                        child: GridCard(
                          title: item['title'] ?? '',
                          imageUrl: item['image'] ?? '',
                          tag: item['type'] ?? '',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
