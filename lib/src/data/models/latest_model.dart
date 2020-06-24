import 'package:equatable/equatable.dart';

class Latest extends Equatable {
  int cases;
  int deaths;
  int recovered;
  int updated;

  Latest({this.cases, this.deaths, this.recovered});

  Latest.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['updated'] = this.updated;
    return data;
  }

  @override
  List<Object> get props => [
    cases,
    deaths,
    updated,
    recovered
  ];
}