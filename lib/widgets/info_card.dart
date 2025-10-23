import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String tag;
  const InfoCard({super.key, required this.title, required this.subtitle, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(subtitle, maxLines: 3, overflow: TextOverflow.ellipsis),
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF0D47A1).withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(tag, style: const TextStyle(color: Color(0xFF0D47A1), fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
