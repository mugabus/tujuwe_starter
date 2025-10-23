import 'dart:async';

class ApiService {
  Future<List<Map<String, String>>> fetchNews() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      {'title': 'UNHCR Launches New Initiative', 'description': 'Helping refugees integrate through new education programs.'},
      {'title': 'Food Support Update', 'description': 'WFP provides food aid to 10,000 families this month.'},
    ];
  }

  Future<List<Map<String, String>>> fetchJobs() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      {'title': 'Teacher Assistant', 'description': 'Support refugee education programs in local centers.'},
      {'title': 'Community Health Worker', 'description': 'Provide healthcare support in refugee camps.'},
    ];
  }

  Future<List<Map<String, String>>> fetchGuides() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      {'title': 'How to Apply for Refugee Status', 'description': 'Step-by-step process for refugee status application.'},
      {'title': 'Legal Aid for Refugees', 'description': 'Find free legal assistance and advocacy organizations.'},
    ];
  }

  Future<List<Map<String, String>>> fetchCombinedFeed() async {
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
// will late and the images 