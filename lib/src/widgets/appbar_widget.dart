import 'package:cronavirus_tracker/src/blocs/covid19/covid19_bloc.dart';
import 'package:cronavirus_tracker/src/data/models/country_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CovidAppBar extends StatefulWidget {
  final Covid19Bloc covid19bloc;
  final List<Country> countries;
  final FocusNode focusNode;
  final ScrollController scrollController;

  CovidAppBar({Key key, this.covid19bloc, this.countries, this.focusNode, this.scrollController}) : super(key: key);

  @override
  _CovidAppBarState createState() => _CovidAppBarState();
}

class _CovidAppBarState extends State<CovidAppBar> {

  _launchURL() async {
    const url = 'https://www.paypal.com/paypalme2/heshamalaw';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Covid19 Live Tracker'),
      floating: true,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () {
            widget.scrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
            widget.focusNode.requestFocus();
          }
        ),
        RaisedButton(child: Text('Buy Me A Coffe'), onPressed: () => _launchURL(),)
      ],
    );
  }
}