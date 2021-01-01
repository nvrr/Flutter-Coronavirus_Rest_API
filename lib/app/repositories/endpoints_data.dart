import 'package:coronavirus_rest_api/app/services/api.dart';
import 'package:coronavirus_rest_api/app/services/endpoint_data.dart';
import 'package:flutter/foundation.dart';

class EndpointsData {
  final Map<Endpoint, EndpointData> values;
  EndpointsData({@required this.values});

  EndpointData get cases => values[Endpoint.cases];
  EndpointData get casesSuspected => values[Endpoint.cases];
  EndpointData get casesConfirmed => values[Endpoint.cases];
  EndpointData get deaths => values[Endpoint.cases];
  EndpointData get recovered => values[Endpoint.cases];

  @override
  String toString() => 'cases: $cases, sucpected: $casesSuspected, confirmed: $casesConfirmed, deaths: $deaths, recoveres: $recovered';
}