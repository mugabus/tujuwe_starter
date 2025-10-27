import 'package:flutter/material.dart';
import '../../../data/datasources/remote/api_service.dart';
import '../../widgets/info_card.dart';
import '../../widgets/loading_indicator.dart';
import '../../screens/details_screen.dart';
import 'package:provider/provider.dart';
import '../../state/content_provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentProvider>(builder: (context, provider, _) {
      if (provider.isLoading) return const LoadingIndicator();
      final news = provider.items.where((i) => i['type']=='News').toList();
      return Scaffold(
        appBar: AppBar(title: const Text('News')),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: news.length,
          itemBuilder: (context, index) {
            final item = news[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(item: item))),
                child: InfoCard(item: item),
              ),
            );
          },
        ),
      );
    });
  }
}
