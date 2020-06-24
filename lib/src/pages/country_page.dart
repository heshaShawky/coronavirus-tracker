import 'package:cronavirus_tracker/src/data/models/country_model.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  static final String routeName = 'country';
  @override
  Widget build(BuildContext context) {
    final Country country = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text(country.country)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            countryDiseaseDetails('Country', country.country, Colors.black),
            countryDiseaseDetails('Total Confirmed Cases', country.cases.toString(), Colors.green),
            countryDiseaseDetails('Deaths', country.deaths.toString(), Colors.red),
            countryDiseaseDetails('Recoverd', country.recovered.toString(), Colors.lightBlue),
            countryDiseaseDetails('Critical Cases', country.critical.toString(), Colors.blueGrey),
            countryDiseaseDetails('Active Cases', country.active.toString(), Colors.deepOrangeAccent)
          ],
        ),
      ), 
    );
  }
}

Widget countryDiseaseDetails( String name, String data, dynamic color ) {
  return Container(
    width: double.infinity,
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child: Text(
            data,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    ),
  );
}