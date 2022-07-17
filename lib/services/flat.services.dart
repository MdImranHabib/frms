import 'dart:convert';

import 'package:frms/models/flat.dart';
import 'package:http/http.dart' as http;

class FlatService {
  //static String url = 'http://localhost:49918/api/flats';
  static String baseUrl = 'http://192.168.2.51:85/api/';

  // Read all the flats
  static Future fetchFlats() async {
    return await http.get(Uri.parse('${baseUrl}flats'));
  }

  //Read a flat details
  static Future fetchFlatDetails(Flat flat) async {
    return await http.get(Uri.parse('${baseUrl}flats/${flat.id}'));
  }

  // Create new flat
  static Future<bool> createFlat(Flat flat) async {
    var url = Uri.parse('${baseUrl}flats');
    var flatMap = flat.toMap();
    var flatBody = json.encode(flatMap);
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: flatBody);
    return Future.value(response.statusCode == 201 ? true : false);
  }

  // Update a flat
  static Future updateFlat(Flat flat) async {
    var url = Uri.parse('${baseUrl}flats/${flat.id}');
    var flatMap = flat.toMap();
    var flatBody = json.encode(flatMap);
    var response = await http.put(url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: flatBody);
    return Future.value(response.statusCode == 200 ? true : false);
  }

  //Delete a flat
  static Future deleteFlat(int flatId) async {
    var url = Uri.parse('${baseUrl}flats/$flatId');
    var response = await http.delete(url);
    return Future.value(response.statusCode == 200 ? true : false);
  }
}
