import 'package:flutter/material.dart';
import '../../presentation/theme/app_text_styles.dart';

class InfoCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback? onTap;

  const InfoCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final image = item['image'] ?? '';
    final title = item['title'] ?? '';
    final tag = item['type'] ?? '';

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image.isNotEmpty)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  image,
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 110,
                    child: Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tag, style: AppTextStyles.tag),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: AppTextStyles.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
