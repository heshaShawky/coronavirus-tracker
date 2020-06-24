import 'package:cronavirus_tracker/src/data/models/latest_model.dart';
import 'package:flutter/material.dart';

class GlobalStatistics extends StatelessWidget {
  final Latest latest;

  const GlobalStatistics({Key key, this.latest}) : super(key: key);
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
                          'Total Confirmed Cases',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 15
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Total Deaths',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 15
                          ),
                        )
                      ),
                      Expanded(
                        child: Text(
                          'Recoverd',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
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

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        latest.cases.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreenAccent,
                          fontSize: 14
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        latest.deaths.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontSize: 14
                        ),
                      )
                    ),
                    Expanded(
                      child: Text(
                        latest.recovered.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                          fontSize: 14
                        ),
                      )
                    ),
                  ],
                ),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                )

              ],
            ),
          );

        },
        childCount: 2
      ),
    );
  }
}