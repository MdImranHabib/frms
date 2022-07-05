import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class FlatService {
  static Uri url = Uri.parse('http://localhost:49918/api/flats');

  static Future fetchFlats() async {
    return await http.get(url);
  }
}
