import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:weartest/utils/date_time_helper.dart';

class MongoDBAPI {

  final _dateTimeHelper = DateTimeHelper();
  final _baseUrl = 'https://led-notificaciones-mongodb.onrender.com/not';

  Future<void> saveNotificationMongoDB(RemoteMessage message) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/create-notificacion'),
      headers: {
        'Content-type': 'application/json'
      },
      body: json.encode({
        'tituloMensaje': message.notification!.title.toString(),
        'cuerpoMensaje': message.notification!.body.toString(),
        'hora': _dateTimeHelper.getFormattedTime(),
        'fecha': _dateTimeHelper.getFormattedDate()
      })
    );

    final jsonResponse = json.decode(response.body);

    print('Se guardo la notificación en mongodb');
    print(jsonResponse);
  }

  Future<List<dynamic>> getNotifications() async {
    final response = await http.get(Uri.parse('$_baseUrl/get-notificaciones'));
    final jsonResponse = json.decode(response.body);

    print('get notificaciones');
    print(jsonResponse);

    if (jsonResponse['success']) return jsonResponse['data'] as List<dynamic>;

    return [];
  }

  

}