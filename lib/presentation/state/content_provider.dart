import 'package:flutter/material.dart';
import '../../data/datasources/remote/api_service.dart';

class ContentProvider extends ChangeNotifier {
  final ApiService apiService;
  bool isLoading = false;
  List<Map<String, dynamic>> items = [];

  ContentProvider(this.apiService);

  Future<void> loadAll() async {
    isLoading = true;
    notifyListeners();
    try {
      items = await apiService.fetchCombinedContent();
    } catch (e) {
      items = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
