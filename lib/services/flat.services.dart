import 'dart:convert';

import 'package:frms/models/flat.dart';
import 'package:http/http.dart' as http;

class FlatService {
  //static String url = 'http://localhost:49918/api/flats';
  static String url = 'http://192.168.2.51:85/api/';

  // Read all the flats
  static Future fetchFlats() async {
    return await http.get(Uri.parse('${url}flats'));
  }

  //Read a flat details
  static Future fetchFlat(Flat flat) async {
    return await http.get(Uri.parse('${url}flats/${flat.id}'));
  }

  // Create new flat
  static Future<bool> createFlat(Flat flat) async {
    var flatMap = flat.toMap();
    var flatBody = json.encode(flatMap);
    var response = await http.post(Uri.parse('${url}flats'), body: flatBody);
    return Future.value(response.statusCode == 201 ? true : false);
  }

  // Update a flat
  static Future updateFlat(Flat flat) async {
    var flatMap = flat.toMap();
    var flatBody = json.encode(flatMap);
    var response =
        await http.put(Uri.parse('${url}flats/${flat.id}'), body: flatBody);
    return Future.value(response.statusCode == 200 ? true : false);
  }

  //Delete a flat
  static Future deleteFlat(Flat flat) async {
    return await http.delete(Uri.parse('${url}flats/${flat.id}'));
  }
}
