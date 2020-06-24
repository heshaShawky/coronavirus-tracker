import 'package:cronavirus_tracker/src/blocs/covid19/covid19_bloc.dart';
import 'package:cronavirus_tracker/src/widgets/all_statistics_widget.dart';
import 'package:cronavirus_tracker/src/widgets/error_widget.dart';
import 'package:cronavirus_tracker/src/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Covid19Bloc _covid19bloc;

 
  @override
  void didChangeDependencies() {
    _covid19bloc = BlocProvider.of<Covid19Bloc>(context);
    _covid19bloc.add(FetchCovid19());

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<Covid19Bloc, Covid19State>(
        listener: (BuildContext context, state) {
          if ( state is Covid19Error ) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.errMsg))
            );
          }
        },
        child: BlocBuilder<Covid19Bloc, Covid19State>(
          builder: (BuildContext context, state) {
            if ( state is Covid19Initial || state is Covid19Loading ) {
              return Loading();
            } else if ( state is Covid19Loaded ) {
              return AllStatistics(
                latest: state.latest,
                countries: state.countries,
                covid19bloc: _covid19bloc,
              );
            }
            return FetchError(
              covid19bloc: _covid19bloc,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _covid19bloc.add(FetchCovid19()),
      ),
    );
  }
}