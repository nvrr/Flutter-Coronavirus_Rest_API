import 'package:coronavirus_rest_api/app/repositories/endpoints_data.dart';
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

  Future<EndpointsData> _getAllEndpointsData() async {
    final values = await Future.wait([
      apiService.getEndpointData(accessToken: _accessToken, endpoint: Endpoint.cases),
      apiService.getEndpointData(accessToken: _accessToken, endpoint: Endpoint.casesSuspected),
      apiService.getEndpointData(accessToken: _accessToken, endpoint: Endpoint.casesConfirmed),
      apiService.getEndpointData(accessToken: _accessToken, endpoint: Endpoint.deaths),
      apiService.getEndpointData(accessToken: _accessToken, endpoint: Endpoint.recovered),
    ]);
    return EndpointsData(
      values: {
        Endpoint.cases: values[0],
        Endpoint.casesSuspected: values[1],
        Endpoint.casesConfirmed: values[2],
        Endpoint.deaths: values[3],
        Endpoint.recovered: values[4],
      }
    );
  }
}