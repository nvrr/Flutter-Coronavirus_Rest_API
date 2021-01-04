import 'package:coronavirus_rest_api/app/repositories/data_repository.dart';
import 'package:coronavirus_rest_api/app/services/api.dart';
import 'package:coronavirus_rest_api/app/services/api_service.dart';
import 'package:coronavirus_rest_api/app/services/data_cache_service.dart';
import 'package:coronavirus_rest_api/app/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
void main() async{
  // here we got error ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized
  // if u r running an application and need to access the binarymessenger before 'runApp()' has been called (for example, during plugin initialization),
  //then u need to explicitly call the 'WidgetsFlutterBinding.ensureInitialzed()' first.
  // if u r running a test, u can call the 'TestWidgetFlutterBinding.ensureInitialized()' as the first line ur test's 'main()' method to initialize the binding.
  WidgetsFlutterBinding.ensureInitialized(); 
  Intl.defaultLocale = 'en_GB';
  await initializeDateFormatting();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences, key: null,));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({@required Key key, this.sharedPreferences}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(API.sandbox()),
        dataCacheService: DataCacheService(sharedPreferences: sharedPreferences),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Coronavirs Tracker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF101010),
          cardColor: Color(0xFF222222),
        ),
        home: Dashboard(),
      ),
    );
  }
}
