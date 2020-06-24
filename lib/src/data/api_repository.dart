
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'models/country_model.dart';
import 'models/latest_model.dart';

abstract class APIRepository {
  Future<Latest> fetchLatest();
  Future<List> fetchCountries();

}

class APIRepositoryImpl extends APIRepository {
  final String _baseUrl = 'https://corona.lmao.ninja';

  @override
  Future<Latest> fetchLatest() async {
    final Response response = await get('$_baseUrl/v2/all');

    if ( response.statusCode == 200 ) {
      final body = jsonDecode(response.body);
      final Latest api = Latest.fromJson(body);
      print(api);

      return api;
    }

    throw "ERR: Couldn't fetch data from api";
  }

  @override
  Future<List> fetchCountries() async {
    final Response response = await get('$_baseUrl/v2/countries?sort=cases');

    if ( response.statusCode == 200 ) {
      final List<dynamic> body = jsonDecode(response.body);
      // print(body);
      final List<Country> api = body.map( (country) => Country.fromJson(country) ).toList();
      // print(api);

      return api;
    }

    throw "ERR: Couldn't fetch data from api";
  }

}