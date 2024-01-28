import 'package:flutter/material.dart';
import 'package:nomster/services/api_service.dart';

class ApiServiceNotifier extends ChangeNotifier {
  final ApiService _apiService = ApiService.instance;

  ApiService get apiService => _apiService;
}
