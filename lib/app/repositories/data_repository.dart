import 'package:coronavirus_rest_api/app/services/api.dart';
import 'package:coronavirus_rest_api/app/services/api_service.dart';
import 'package:flutter/material.dart';

class DataRepository {
  final APIService apiService;
  DataRepository({@required this.apiService});

  Future<int> getEndpointData(Endpoint endpoint) async{
    final accessToken = await apiService.getAccessToken();
    return await apiService.getEndpointData(accessToken: accessToken, endpoint: endpoint);
  }
}