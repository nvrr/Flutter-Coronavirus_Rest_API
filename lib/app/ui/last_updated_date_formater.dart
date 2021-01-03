import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class LastUpdatedDateFormatter {
  final DateTime lastUpdated;
  LastUpdatedDateFormatter({@required this.lastUpdated});

  String lastUpdatedStatusText() {
    if (lastUpdated != null) {
      final formatter = DateFormat.yMd().add_Hms();
      final formatted = formatter.format(lastUpdated);
      return 'Last updated: $formatted';
    }
    return '';
  }
}