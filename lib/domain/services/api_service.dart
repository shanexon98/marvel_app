import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class ApiService {
  final String _publicKey = 'c08bbaa44612495346d2508d7e3e8baa';
  final String _privateKey = '924cdae515631d07a7565007d3e7fa12bf7c177d';
  final String _baseUrl = 'https://gateway.marvel.com';

  Future<Map<String, dynamic>> fetchData(
    String endpoint, {
    String query = '',
    int offset = 0,
  }) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash =
        md5.convert(utf8.encode('$ts$_privateKey$_publicKey')).toString();
    String url =
        '$_baseUrl/v1/public/$endpoint?apikey=$_publicKey&hash=$hash&ts=$ts&offset=$offset&limit=20';

    if (query.isNotEmpty) {
      url = '$url&nameStartsWith=$query';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
