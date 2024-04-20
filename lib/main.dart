// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'ThemeProvider.dart';
import 'application.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(ThemeData.light()), // Default to light theme
        child: const Application(),
      ),
  );
}
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//
//   print("Handling a background message: ${message.messageId}");
// }
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   // Set up background message handler
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//   // Get the token for this device
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   String? token = await messaging.getToken();
//   print("Firebase Messaging Token: $token");
//
//   // Listen to messages when the app is in the foreground
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print("Got a message whilst in the foreground!");
//     print("Message data: ${message.data}");
//
//     if (message.notification != null) {
//       print("Message also contained a notification: ${message.notification}");
//     }
//   });
//
//   runApp(const Application());
// }
