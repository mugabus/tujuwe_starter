import 'package:flutter/material.dart';
import '../../state/content_provider.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/info_card.dart';
import '../../screens/details_screen.dart';
import 'package:provider/provider.dart';

class GuidesScreen extends StatelessWidget {
  const GuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentProvider>(builder: (context, provider, _) {
      if (provider.isLoading) return const LoadingIndicator();
      final items = provider.items.where((i) => i['type']=='Guide').toList();
      return Scaffold(
        appBar: AppBar(title: const Text('Guides')),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
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
