import 'package:cronavirus_tracker/src/blocs/covid19/covid19_bloc.dart';
import 'package:cronavirus_tracker/src/data/api_repository.dart';
import 'package:cronavirus_tracker/src/pages/country_page.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/home_page.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  // final FirebaseAnalytics analytics = FirebaseAnalytics();



  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Covid19Bloc(apiRepository: APIRepositoryImpl(), navigatorKey: _navigatorKey),
      child: MaterialApp(
        title: 'Covid19-tracker',
        navigatorObservers: [
          // FirebaseAnalyticsObserver(analytics: analytics),
        ],
        navigatorKey: _navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.dark
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (_) => HomePage(),
          CountryPage.routeName: (_) => CountryPage()
        },
      ),
    );
  }
}
