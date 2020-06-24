import 'package:cached_network_image/cached_network_image.dart';
import 'package:cronavirus_tracker/src/blocs/covid19/covid19_bloc.dart';
import 'package:cronavirus_tracker/src/data/models/country_model.dart';
import 'package:flutter/material.dart';

class CouuntriesStatistics extends StatelessWidget {

  final List<Country> countries;
  final Covid19Bloc covid19bloc;

  const CouuntriesStatistics({Key key, this.countries, this.covid19bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          if ( i == 0 ) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Region',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Confirmed',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 15
                          ),
                        )
                      ),
                      Expanded(
                        child: Text(
                          'Deaths',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 15
                          ),
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                    width: double.infinity,
                    child: Container(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            );
          }

          final Country country = countries[(i - 1)];

          return InkWell(
            onTap: () {
              // Navigator.of(context).pushNamed(CountryPage.routeName, arguments: country);
              covid19bloc.add(NavigateToCountry(country));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CachedNetworkImage(
                              width: 30,
                              imageUrl: country.countryInfo.flag,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            SizedBox(width: 5,),
                            Expanded(
                              child: Text(
                                country.country,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ), 
                                softWrap: true,
                              ),
                            )
                          ],
                        )
                      ),
                      Expanded(
                        child: Text(
                          country.cases.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreenAccent
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          country.deaths.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent
                          ),
                        ),
                      ),
                    ],
                  ),

                    SizedBox(
                      height: 1,
                      width: double.infinity,
                      child: Container(
                        color: Colors.grey,
                      ),
                    )
                ],
              ),
            ),
          );
        },
        childCount: countries.length + 1
      ),
    );
  }
}