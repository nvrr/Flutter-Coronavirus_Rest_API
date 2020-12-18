import 'package:coronavirus_rest_api/app/services/api.dart';
import 'package:http/http.dart' as http;

class APIService {
  final API api;
  APIService(this.api);

  Future<String> getAcessToken() async{
    final response = await http.post(
      api.tokenUri().toString(),
      headers: {'Authorization': 'Basic ${api.apiKey}'},
    );
  }
  
}