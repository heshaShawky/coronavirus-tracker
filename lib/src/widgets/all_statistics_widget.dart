import 'package:cronavirus_tracker/src/blocs/covid19/covid19_bloc.dart';
import 'package:cronavirus_tracker/src/data/models/country_model.dart';
import 'package:cronavirus_tracker/src/data/models/latest_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'appbar_widget.dart';
import 'countries_statistics_widget.dart';
import 'global_statistics_widget.dart';

class AllStatistics extends StatefulWidget {
  final Latest latest;
  final List<Country> countries;
  final Covid19Bloc covid19bloc;
  
  const AllStatistics({Key key, this.latest, this.countries, this.covid19bloc}) : super(key: key);

  @override
  _AllStatisticsState createState() => _AllStatisticsState();
}

class _AllStatisticsState extends State<AllStatistics> {
   FocusNode focusNode;
   ScrollController scrollController;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.unfocus();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  _launchURL() async {
    const url = 'https://heshamshawky.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        CovidAppBar(
          covid19bloc: widget.covid19bloc,
          countries: widget.countries,
          focusNode: focusNode,
          scrollController: scrollController
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              // IconButton(icon: Icon(Icons.search), onPressed: () => _focusNode.requestFocus()),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 40.0,
                  width: double.infinity,
                  child: CupertinoTextField(
                    focusNode: focusNode,
                    onSubmitted: (_) {
                      focusNode.unfocus();
                    },
                    onChanged: (String query) {
                      // print(query);
                      widget.covid19bloc.add(Search(countries: widget.countries, searchTxt: query));
                    },
                    keyboardType: TextInputType.text,
                    placeholder: 'Search... Ex: China, usa ...etc',
                    placeholderStyle: TextStyle(
                      color: Color(0xffC4C6CC),
                      fontSize: 14.0,
                      fontFamily: 'Brutal',
                    ),
                    prefix: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                      child: Icon(
                        Icons.search,
                        color: Color(0xffC4C6CC),
                      ),
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xffF0F1F5),
                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Countries where Covid19 Coronavirus has spread. '
                      ),
                      TextSpan(
                        text: 'Last Updated: ' + new DateTime.fromMillisecondsSinceEpoch(widget.latest.updated).toString(),
                        style: TextStyle(
                          color: Colors.lightGreenAccent,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'This App Developed By '
                      ),
                      TextSpan(
                        text: 'Hesham Shawky',
                        style: TextStyle(
                          color: Colors.lightGreenAccent,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ]
                  ),
                ),
              ),
              RaisedButton(
                child: Text('Contact me', style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () => _launchURL(),
              )
            ]
          )
        ),
        GlobalStatistics(
          latest: widget.latest,
        ),
        CouuntriesStatistics(
          countries: widget.countries,
          covid19bloc: widget.covid19bloc,
        )
      ],
    );
  }
}


