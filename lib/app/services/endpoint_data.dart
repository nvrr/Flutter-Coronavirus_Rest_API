import 'package:flutter/foundation.dart';
import 'package:flutter/semantics.dart';

class EndpointData {
  final int value;
  final DateTime date;

  EndpointData({@required this.value, this.date}) : assert(value != null);

  @override toString() => 'date: $date, value: $value';
}