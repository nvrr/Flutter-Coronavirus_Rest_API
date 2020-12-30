import 'package:coronavirus_rest_api/app/services/api.dart';
import 'package:flutter/material.dart';

class EndpointCard extends StatelessWidget {
  final Endpoint endpoint;
  final int value;

  const EndpointCard({Key key, this.endpoint, this.value}) : super(key: key);
  
  static Map<Endpoint, String> _cardTitles = {
    Endpoint.cases: 'Cases',
    Endpoint.casesSuspected: 'Suspectd cases',
    Endpoint.casesConfirmed: 'Confirmed cases',
    Endpoint.deaths: 'Deaths',
    Endpoint.recovered: 'Recovered',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _cardTitles[endpoint],
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                value != null ? value.toString() : '',
                style: Theme.of(context).textTheme.headline4,
              ),
            ]
          ),
        )
      ),
    );
  }
}