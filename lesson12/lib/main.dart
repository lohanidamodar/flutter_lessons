import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HTTP Request",
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {

  Future<List> getCurrencies() async {
    http.Response res = await http.Client().get('https://api.coinlore.com/api/tickers');
    return json.decode(res.body);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Currencies'),
      ),
      body: Container(
        child: FutureBuilder(
          future: getCurrencies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
            if(snapshot.hasError) return Center(child: Text("There was an error"),);
            List data =snapshot.data;
            ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                Coin coin = Coin.fromMap(data[index]);
                return ListTile(
                  title: Text(coin.name),
                  subtitle: Text(coin.symbol),
                  trailing: Text(coin.priceUSD),
                );
             },
            );
          },
        ),
      ),
    );
  }
}

class Coin {
  String id;
  String symbol;
  String name;
  String priceUSD;

  Coin.fromMap(Map data):
    id=data['id'],
    symbol=data['symbol'],
    name=data['name'],
    priceUSD=data['price_usd'];
}