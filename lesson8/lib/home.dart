import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatelessWidget {
  Future<Map> getPriceList() async {
    http.Response response = await http.get("https://api.coingecko.com/api/v3/exchange_rates");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP & Future Builder"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getPriceList(),
          builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
            if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator(),
            );
            if (snapshot.hasError) return Center(
              child: Text("There is some error getting data from the internet."),
            );
            Map data = snapshot.data;
            List<Map> rates = List<Map>.from(data['rates'].values);
            return ListView.builder(
              itemCount: rates.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(rates[index]['name']),
                  trailing: Text('${rates[index]['value']}'),
                );
              },
            );
            
          },
        ),
      ),
    );
  }
}