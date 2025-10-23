import 'dart:async';

class ApiService {
  Future<List<Map<String, dynamic>>> fetchNews() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      {
        'title': 'UNHCR launches education program',
        'description': 'New education initiative to help refugee children attend school.',
        'image': 'https://picsum.photos/seed/news1/800/400'
      },
      {
        'title': 'Food support updates',
        'description': 'WFP scales up food distribution to remote settlements.',
        'image': 'https://picsum.photos/seed/news2/800/400'
      }
    ];
  }

  Future<List<Map<String, dynamic>>> fetchJobs() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      {
        'title': 'Teacher Assistant',
        'description': 'Support refugee education programs in local centers.',
        'image': 'https://picsum.photos/seed/job1/800/400'
      },
      {
        'title': 'Community Health Worker',
        'description': 'Provide healthcare support in refugee camps.',
        'image': 'https://picsum.photos/seed/job2/800/400'
      }
    ];
  }

  Future<List<Map<String, dynamic>>> fetchGuides() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      {
        'title': 'How to apply for refugee status',
        'description': 'Step-by-step process for refugee status application.',
        'image': 'https://picsum.photos/seed/guide1/800/400'
      },
      {
        'title': 'Legal aid for refugees',
        'description': 'Find free legal assistance and advocacy organizations.',
        'image': 'https://picsum.photos/seed/guide2/800/400'
      }
    ];
  }

  Future<List<Map<String, dynamic>>> fetchCombinedFeed() async {
    final news = await fetchNews();
    final jobs = await fetchJobs();
    final guides = await fetchGuides();
    return [
      ...news.map((n) => {...n, 'type': 'News'}),
      ...jobs.map((j) => {...j, 'type': 'Job'}),
      ...guides.map((g) => {...g, 'type': 'Guide'}),
    ];
  }
}
