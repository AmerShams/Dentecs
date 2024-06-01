// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, unused_local_variable

import 'package:http/http.dart' as http;
import 'dart:convert';

// String _basicAuth = 'Basic ' + base64Encode(utf8.encode('amer:amer1234'));

// Map<String, String> myheaders = {'authorization': _basicAuth};

mixin Crud {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(utf8.decode(response.bodyBytes));
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  getReq(String url, String head) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Authorization": "JWT $head"},
      );
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  postRequest(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = jsonDecode(response.body);

        return response;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  postReq(String url, String head, Map data) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Authorization": "JWT $head"},
        body: data,
      );
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  putReq(String url, String head, Map data) async {
    try {
      var response = await http.put(
        Uri.parse(url),
        headers: {"Authorization": "JWT $head"},
        body: data,
      );
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }
}
