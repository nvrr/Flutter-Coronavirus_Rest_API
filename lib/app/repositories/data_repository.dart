import 'package:coronavirus_rest_api/app/services/api.dart';
import 'package:coronavirus_rest_api/app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DataRepository {
  final APIService apiService;
  DataRepository({@required this.apiService});

  String _accessToken;

  Future<int> getEndpointData(Endpoint endpoint) async{
    try {
      if (_accessToken == null) {
      _accessToken = await apiService.getAccessToken();
    }
    return await apiService.getEndpointData(accessToken: _accessToken, endpoint: endpoint);
    } on Response catch (response) {
      // if unauthorization, get access token again
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await apiService.getEndpointData(accessToken: _accessToken, endpoint: endpoint);
      }
      rethrow;
    }
  }

  Future<void> _getAllEndpointsData() async {
    await Future.wait([
      apiService.getEndpointData(accessToken: _accessToken, endpoint: Endpoint.cases),
      apiService.getEndpointData(accessToken: _accessToken, endpoint: Endpoint.casesSuspected),
      apiService.getEndpointData(accessToken: _accessToken, endpoint: Endpoint.casesConfirmed),
      apiService.getEndpointData(accessToken: _accessToken, endpoint: Endpoint.deaths),
      apiService.getEndpointData(accessToken: _accessToken, endpoint: Endpoint.recovered),
    ]);
  }
}