import 'package:flutter/material.dart';
import '../../../data/datasources/remote/api_service.dart';
import '../../widgets/info_card.dart';
import '../../widgets/loading_indicator.dart';
import '../../theme/app_text_styles.dart';
import '../../state/content_provider.dart';
import 'package:provider/provider.dart';
import '../../screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ContentProvider>(context, listen: false);
    provider.loadAll();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentProvider>(builder: (context, provider, _) {
      if (provider.isLoading) return const LoadingIndicator();
      final items = provider.items;
      final news = items.where((i) => i['type']=='News').toList();
      final others = items.where((i) => i['type']!='News').toList();

      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Welcome to TUJUWE', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height:6),
                Text('Get the latest updates, opportunities and guidance.', style: TextStyle(color: Colors.black54)),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: news.length,
                itemBuilder: (context, index) {
                  final item = news[index];
                  return Padding(
                    padding: const EdgeInsets.only(right:12.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(item: item))),
                      child: SizedBox(width: 260, child: InfoCard(item: item)),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPadding(padding: const EdgeInsets.symmetric(horizontal:16, vertical: 12),
            sliver: SliverToBoxAdapter(child: Text('Jobs & Guides', style: AppTextStyles.title.copyWith(fontSize:18))),),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = others[index];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(item: item))),
                  child: InfoCard(item: item),
                );
              }, childCount: others.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2, mainAxisSpacing:12, crossAxisSpacing:12, childAspectRatio:0.85),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height:20)),
        ],
      );
    });
  }
}
