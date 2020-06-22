import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search;
  int _offset = 0;

  Future<Map> _getGiphs() async {
    http.Response response;
    if (_search == null) {
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=24GhUMvV7Ot3939pooSO79PUt78F10GT&limit=20&rating=G");
    } else {
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=24GhUMvV7Ot3939pooSO79PUt78F10GT&q=$_search&limit=25&offset=$_offset&rating=G&lang=en");
    }
    return json.decode(response.body);
  }
  
  @override
  void initState() {
    super.initState();
    _getGiphs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}