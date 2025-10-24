import 'dart:async';

class ApiService {
  Future<List<Map<String, dynamic>>> fetchNews() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        'title': 'UNHCR reports 122 million people forcibly displaced globally',
        'description': 'According to the UN refugee agency, the number of people uprooted due to war, persecution and violence has risen to more than 122 million. Conflict in Sudan, Syria and Afghanistan remains large-scale. ',
        'image': 'https://picsum.photos/seed/news_real1/800/400',
        'type': 'News',
      },
      {
        'title': 'Shelter crisis in eastern DRC leaves 350 000 refugees unsupported',
        'description': 'The UN refugee agency warns that rebel advances in eastern DRC have destroyed camps and forced 350,000 people into makeshift accommodation without proper shelter.',
        'image': 'https://picsum.photos/seed/news_real2/800/400',
        'type': 'News',
      },
    ];
  }

  Future<List<Map<String, dynamic>>> fetchJobs() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        'title': 'Associate Education Officer – UNHCR (Global)',
        'description': 'Lead refugee education programmes and support displaced children’s access to schooling. Application via UNHCR careers portal.',
        'image': 'https://picsum.photos/seed/job_real1/800/400',
        'type': 'Job',
      },
      {
        'title': 'Legal Fellow – Refugee Rights (UNHCR Partner)',
        'description': 'Work to secure legal status and rights for refugees in host communities. Prefer applicant with refugee protection background.',
        'image': 'https://picsum.photos/seed/job_real2/800/400',
        'type': 'Job',
      },
    ];
  }

  Future<List<Map<String, dynamic>>> fetchGuides() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        'title': 'Guide to Refugee Legal Status & Integration',
        'description': 'Understand your rights under international law and how to access legal assistance and enrol in education programmes.',
        'image': 'https://picsum.photos/seed/guide_real1/800/400',
        'type': 'Guide',
      },
      {
        'title': 'Starting a Small Business as a Refugee in Uganda',
        'description': 'Step-by-step support for refugees looking to start a business in Uganda: permits, funding sources, local partners.',
        'image': 'https://picsum.photos/seed/guide_real2/800/400',
        'type': 'Guide',
      },
    ];
  }

  Future<List<Map<String, dynamic>>> fetchScholarships() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        'title': 'Building Better Futures Campaign: dallors 15 M for Refugee Education',
        'description': 'USA for UNHCR launches a multi-year campaign to improve higher education access for refugee women and girls globally.',
        'image': 'https://picsum.photos/seed/scholarship_real1/800/400',
        'type': 'Scholarship',
      },
      {
        'title': 'Global Access Grant for Displaced Students',
        'description': 'New grant programme opens for students displaced by conflict seeking university abroad. Application opens soon.',
        'image': 'https://picsum.photos/seed/scholarship_real2/800/400',
        'type': 'Scholarship',
      },
    ];
  }


  Future<List<Map<String, dynamic>>> fetchCombinedFeed() async {
    final news = await fetchNews();
    final jobs = await fetchJobs();
    final guides = await fetchGuides();
    final scholarships = await fetchScholarships();

    return [...news, ...jobs, ...guides, ...scholarships];
  }
}
