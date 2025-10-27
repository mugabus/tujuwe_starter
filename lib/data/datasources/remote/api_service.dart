import 'dart:async';

class ApiService {
  Future<List<Map<String, dynamic>>> fetchNews() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      {'id': 1, 'title': 'UNHCR reports record displacement', 'description': 'UNHCR reports record levels...', 'image': 'https://picsum.photos/seed/n1/800/400', 'type':'News'},
      {'id': 2, 'title': 'Local NGO education drive', 'description': 'New programs to enroll children', 'image': 'https://picsum.photos/seed/n2/800/400', 'type':'News'},
    ];
  }

  Future<List<Map<String, dynamic>>> fetchJobs() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      {'id': 10, 'title': 'Community Outreach Officer', 'description': 'Work with refugee communities', 'image': 'https://picsum.photos/seed/j1/800/400', 'type':'Job'},
    ];
  }

  Future<List<Map<String, dynamic>>> fetchGuides() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      {'id': 20, 'title': 'How to apply for status', 'description': 'Step-by-step guide', 'image': 'https://picsum.photos/seed/g1/800/400', 'type':'Guide'},
    ];
  }

  Future<List<Map<String, dynamic>>> fetchScholarships() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      {'id': 30, 'title': 'Refugee Scholars Program', 'description': 'Full scholarship opportunity', 'image': 'https://picsum.photos/seed/s1/800/400', 'type':'Scholarship'},
    ];
  }

  Future<List<Map<String, dynamic>>> fetchCombinedContent() async {
    final news = await fetchNews();
    final jobs = await fetchJobs();
    final guides = await fetchGuides();
    final scholarships = await fetchScholarships();
    return [...news, ...jobs, ...guides, ...scholarships];
  }
}
