part of 'covid19_bloc.dart';

abstract class Covid19Event extends Equatable {
  const Covid19Event();
}

class FetchCovid19 extends Covid19Event {
  @override
  List<Object> get props => [];
}

class Search extends Covid19Event {
  final List<Country> countries;
  final String searchTxt;
  const Search({this.countries, this.searchTxt});

  @override
  List<Object> get props => [countries, searchTxt];

}

class NavigateToCountry extends Covid19Event {
  final Country country;
  const NavigateToCountry(this.country);
  
  @override
  List<Object> get props => [country];

}