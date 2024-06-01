// // ignore_for_file: non_constant_identifier_names, unused_local_variable

// import 'dart:convert';

// import 'package:http/http.dart' as http;

// SendM(title, message, Tok) async {
//   var headersList = {
//     'Accept': '*/*',
//     'Content-Type': 'application/json',
//     'Authorization':
//         'key=AAAAxqdhXb0:APA91bHsyytDv9JiuisDo6xE68Ar12IYNKmGu9mEp5eDCMqQPx1jNBNFavEvRsFtvHh3D3yDg1-0Q0ecaZJel-l8o52jrR-QsCKW9y8YtNSOWsfyoYbDqlQrQJ5kXVun0Zf_HZj2yKQf'
//   };

//   var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
//   var body = {
//     "to": "/topics/$Tok",
//     "notification": {
//       "title": title,
//       "body": message,
//     }
//   };

//   var req = http.Request('POST', url);
//   req.headers.addAll(headersList);
//   req.body = json.encode(body);
//   var res = await req.send();
//   final resBody = await res.stream.bytesToString();

//   if (res.statusCode >= 200 && res.statusCode <= 300) {
//     // print(resBody);
//   } else {
//     // print(res.reasonPhrase);
//   }
// }
