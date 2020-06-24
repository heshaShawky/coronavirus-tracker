part of 'covid19_bloc.dart';

abstract class Covid19State extends Equatable {
  const Covid19State();
}

class Covid19Initial extends Covid19State {
  const Covid19Initial();
  
  @override
  List<Object> get props => [];
}

class Covid19Loading extends Covid19State {
  const Covid19Loading();

  @override
  List<Object> get props => [];
}

class Covid19Loaded extends Covid19State {
  final List<Country> countries;
  final Latest latest;
  const Covid19Loaded({
    this.countries,
    this.latest
  });

  @override
  List<Object> get props => [countries, latest];
}

class Covid19Error extends Covid19State {
  final String errMsg;
  const Covid19Error(this.errMsg);

  @override
  List<Object> get props => [errMsg];
}
