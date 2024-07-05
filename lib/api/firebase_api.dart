import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:weartest/api/mongodb_api.dart';
import 'package:weartest/main.dart';

class FirebaseApi {

  final _mongodbapi = MongoDBAPI();

  // Create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // Function to initialize notifications
  Future <void> initNotifications() async {
    // Request permission from user 
    await _firebaseMessaging.requestPermission();
    _firebaseMessaging.subscribeToTopic('led');

    // Fetch the FCM (Fire Cloud Messaging) token for the device
    final FCMToken = await _firebaseMessaging.getToken();

    //Print the token (send this to your server)
    print('Token: $FCMToken');
    initPushNotifications();
  }

  // Function to handle received messages
  void handleMessage(RemoteMessage? message) async {

    if (message == null) return;

    try {
      await _mongodbapi.saveNotificationMongoDB(message);

    } catch(e) {
      print('ERROR AL GUARDAR');
      print(e);
    }

    navigatorKey.currentState?.pushNamed('/home_page');
  }

  // Function to initialize foreground and background settings
  Future initPushNotifications() async {

    //Handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // Attach event listeners fot when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    //Actualizar cuando llegan los mensajes
    FirebaseMessaging.onMessage.listen(handleMessage);

  }
}