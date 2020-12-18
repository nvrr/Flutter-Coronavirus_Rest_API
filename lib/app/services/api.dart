import 'package:coronavirus_rest_api/app/services/api_keys.dart';
import 'package:flutter/foundation.dart';

class API {
  final String apiKey;
  API({@required this.apiKey});

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = 'ncov2019-admin.firebaseapp.com';

  Uri tokenUri() => Uri(
    scheme: 'https',
    host: host,
    path: 'token',
  );
}