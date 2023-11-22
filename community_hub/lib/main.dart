import 'package:community_hub/core/services/notification/notification.dart';
import 'package:community_hub/lib.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'app.dart';
import 'firebase_options.dart';

//background notification handler
@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  //await Firebase.initializeApp();
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await notificationsPlugin.show(
      1,
      message.notification!.title,
      message.notification!.body,
      const NotificationDetails(
          android: AndroidNotificationDetails('noti', 'noti',
              priority: Priority.max,
              importance: Importance.max,
              enableVibration: true,
              // sound: RawResourceAndroidNotificationSound('bell_tick'),
              // icon: '@mipmap/ic_launcher',
              channelDescription: 'noti')));
}

late final FirebaseApp app;
late final FirebaseAuth auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //set app orientation to only portrait view
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //Initialize FirebaseApp and FirebaseAuth into app
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  // handle background notification
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  //initialize notification service and check for initial message, background message and foreground message
  NotificationService.initialize();
  await NotificationService.requestPermission();

  runApp(const ProviderScope(child: MyApp()));

}
