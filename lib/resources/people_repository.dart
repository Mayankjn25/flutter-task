import 'dart:convert';

import 'package:flutter_task/models/people_model.dart';
import 'package:http/http.dart' as http;

class PeopleRepository {

  static const String url = 'https://jsonplaceholder.typicode.com/users';

  final http.Client _httpClient;

  PeopleRepository({http.Client? httpClient})
  : _httpClient = httpClient ?? http.Client();
  
  Future<List<People>> getPeople() async {
    try{
      final response = await _httpClient.get(Uri.parse(url));
      if(response.statusCode == 200) {
       var data = jsonDecode(response.body);
       List<People> peopleList = [];
       data.forEach((e){
         People people = People.fromJson(e);
         peopleList.add(people);
       });
       return peopleList;
      }
      //return [];
    } catch(err) {
      print(err);
    }
    return [];
  }

}