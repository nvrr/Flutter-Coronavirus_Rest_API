import 'package:coronavirus_rest_api/app/services/api.dart';
import 'package:flutter/foundation.dart';

class EndpointsData {
  final Map<Endpoint, int> values;
  EndpointsData({@required this.values});

  int get cases => values[Endpoint.cases];
  int get casesSuspected => values[Endpoint.cases];
  int get casesConfirmed => values[Endpoint.cases];
  int get deaths => values[Endpoint.cases];
  int get recovered => values[Endpoint.cases];

  @override
  String toString() => 'cases: $cases, sucpected: $casesSuspected, confirmed: $casesConfirmed, deaths: $deaths, recoveres: $recovered';
}