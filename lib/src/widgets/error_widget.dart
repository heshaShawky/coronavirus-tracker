import 'package:cronavirus_tracker/src/blocs/covid19/covid19_bloc.dart';
import 'package:flutter/material.dart';

class FetchError extends StatelessWidget {
  final Covid19Bloc covid19bloc;

  const FetchError({Key key, this.covid19bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.network_check,
              size: 100,
              color: Colors.white,
            ),
            Text(
                'Please Check your network connection then, click reload',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            RaisedButton(
              onPressed: () => covid19bloc.add(FetchCovid19()),
              child: Text(
                'Reload'
              ),
            )
          ],
        ),
      ),
    );
  }

}