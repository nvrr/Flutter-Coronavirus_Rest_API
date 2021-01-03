import 'dart:io';

import 'package:coronavirus_rest_api/app/repositories/data_repository.dart';
import 'package:coronavirus_rest_api/app/repositories/endpoints_data.dart';
import 'package:coronavirus_rest_api/app/services/api.dart';
import 'package:coronavirus_rest_api/app/ui/endpoint_card.dart';
import 'package:coronavirus_rest_api/app/ui/last_updated_date_formater.dart';
import 'package:coronavirus_rest_api/app/ui/last_updated_status_text.dart';
import 'package:coronavirus_rest_api/app/ui/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData _endpointsData;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    try {
      final dataRepository =
          Provider.of<DataRepository>(context, listen: false);
      final endpointsData = await dataRepository.getAllEndpointsData();
      setState(() => _endpointsData = endpointsData);
    } on SocketException catch (_) {
      showAlertDialog(
        context: context,
        title: 'Connection Error',
        content: 'Could not retrieve data, Please try again later.',
        defaultActionText: 'OK',
      );
    } catch (_) { // u can test this may making exception like throw{}; in data_repository.dart in repositories folder at _getDataRefreshingToken<T>({});
      showAlertDialog(
        context: context,
        title: 'Unknown Error',
        content: 'Please contact support or try again later.',
        defaultActionText: 'OK',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = LastUpdatedDateFormatter(
      lastUpdated: _endpointsData != null
          ? _endpointsData.values[Endpoint.cases].date
          : null,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Tracker'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            LastUpdatedStatusText(
              text: formatter.lastUpdatedStatusText(),
            ),
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData.values[endpoint].value
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}