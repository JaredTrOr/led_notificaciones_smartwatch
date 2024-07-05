import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:weartest/api/mongodb_api.dart';
import 'dart:async'; // Importa la librería para usar Timer

class ListNotificationPage extends StatefulWidget {
  @override
  _ListNotificationPageState createState() => _ListNotificationPageState();
}

class _ListNotificationPageState extends State<ListNotificationPage> {
  List<dynamic> _notifications = [];
  final _mongodbapi = MongoDBAPI();
  Color _backgroundColor = Colors.white; // Color de fondo inicial

  @override
  void initState() {
    super.initState();
    _loadNotifications();

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      setState(() {
        if (message != null) {
          // Cambia el color de fondo a amarillo
          _backgroundColor = Colors.yellow;

          // Después de 2 segundos, vuelve a cambiar el color de fondo al original
          Timer(const Duration(seconds: 2), () {
            setState(() {
              _backgroundColor = Colors.white;
            });
          });

        }
      });
    });
  }

  Future<void> _loadNotifications() async {
    try {
      final notifications = await _mongodbapi.getNotifications();
      setState(() {
        _notifications = notifications;
      });
    } catch (e) {
      print('Error fetching notifications: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: _backgroundColor, // Usa el color de fondo controlado por el estado
        child: _notifications.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_off,
                      size: 50.0, // Tamaño del ícono
                      color: Colors.grey, // Color del ícono
                    ),
                    SizedBox(height: 16.0), // Espacio entre el ícono y el texto
                    Text(
                      'No hay notificaciones',
                      style: TextStyle(fontSize: 16, color: Colors.grey), // Estilo del texto
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8.0), // Espacio alrededor de la lista
                itemCount: _notifications.length,
                itemBuilder: (context, index) {
                  final notification = _notifications[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 4.0), // Espacio vertical reducido
                    elevation: 2.0, // Sombra más sutil
                    child: Padding(
                      padding: EdgeInsets.all(6), // Espacio interno reducido
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            notification['tituloMensaje'] ?? 'No hay titulo',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), // Fuente más pequeña
                          ),
                          SizedBox(height: 4.0), // Espacio reducido
                          Text(
                            notification['cuerpoMensaje'] ?? 'No hay cuerpo de mensaje',
                            style: TextStyle(fontSize: 10), // Fuente más pequeña
                          ),
                          SizedBox(height: 4.0), // Espacio reducido
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  notification['fecha'] ?? 'No hay fecha',
                                  style: TextStyle(fontSize: 10, color: Colors.grey), // Fuente muy pequeña
                                  overflow: TextOverflow.ellipsis, // Trunca texto largo
                                ),
                              ),
                              SizedBox(width: 4.0), // Espacio reducido
                              Text(
                                notification['hora'] ?? 'No hay hora',
                                style: TextStyle(fontSize: 10, color: Colors.grey), // Fuente muy pequeña
                                overflow: TextOverflow.ellipsis, // Trunca texto largo
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
