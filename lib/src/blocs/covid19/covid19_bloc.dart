import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cronavirus_tracker/src/data/api_repository.dart';
import 'package:cronavirus_tracker/src/data/models/country_model.dart';
import 'package:cronavirus_tracker/src/data/models/latest_model.dart';
import 'package:cronavirus_tracker/src/pages/country_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'covid19_event.dart';
part 'covid19_state.dart';

class Covid19Bloc extends Bloc<Covid19Event, Covid19State> {
  List<Country> _countries;
  Latest _latest;
  final APIRepository apiRepository;
  final GlobalKey<NavigatorState> navigatorKey;

  Covid19Bloc({this.apiRepository, this.navigatorKey});

  @override
  Covid19State get initialState => Covid19Initial();

  @override
  Stream<Covid19State> mapEventToState(
    Covid19Event event,
  ) async* {
    final currentState = state;
    if (event is FetchCovid19) {
      try {
        yield Covid19Loading();
        final data = await Future.wait([
          apiRepository.fetchLatest(),
          apiRepository.fetchCountries(),
        ]);
        _latest = data[0];
        _countries = data[1];
        // final List<Country> Countries = await apiRepository.fetchCountries();
        yield Covid19Loaded(
          latest: _latest,
          countries: _countries
        );
      } catch(_) {
        print(_);
        yield Covid19Error('Couldn\'t Fetch Data From Server, Please Reload The Page');
      }
    } else if ( event is NavigateToCountry ) {
      // print(event.country);
      navigatorKey.currentState.pushNamed(CountryPage.routeName, arguments: event.country);
    } else if ( event is Search ) {
      // print(_countries.length);
      if ( currentState is Covid19Loaded ) {
        List<Country> countriesSearch = event.searchTxt.isNotEmpty ? _countries.where((country) => country.country.toLowerCase().indexOf(event.searchTxt.toLowerCase()) > - 1 ).toList() : _countries;
        // print(countriesClone.length);
        yield Covid19Loaded(
          latest: currentState.latest,
          countries: countriesSearch
        );
      }
    }
  } 
}
