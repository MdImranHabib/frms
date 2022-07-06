import 'package:http/http.dart' as http;

class FlatService {
  //static String url = 'http://localhost:49918/api/flats';
  static String url = 'http://192.168.2.51:85/api/flats';

  static Future fetchFlats() async {
    return await http.get(Uri.parse(url));
  }
}
