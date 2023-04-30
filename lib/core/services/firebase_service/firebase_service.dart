// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import '../main.dart';
// import '../ui/saved_address.dart';
// import '../utility/logger.dart';

// class FirebaseNotificationModel {
//   final String? pageRoute;
//   FirebaseNotificationModel({
//     required this.pageRoute,
//   });
//   factory FirebaseNotificationModel.fromJson(Map<String, dynamic> json) =>
//       FirebaseNotificationModel(
//         pageRoute: json["pageRoute"],
//       );

//   Map<String, dynamic> toJson() => {
//         "pageRoute": pageRoute,
//       };
// }

// class NavigatorService {
//   static final GlobalKey<NavigatorState> _navigatorKey =
//       GlobalKey<NavigatorState>();
//   static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

//   static Future<dynamic>? navigateTo(
//       {String? page, GlobalKey<NavigatorState>? navigateKey}) {
//     if (navigateKey == null) {
//       return navigatorKey.currentState?.pushNamed(page!);
//     } else {
//       return navigatorKey.currentState?.pushNamed(page!);
//     }
//   }
// }

// class FirebaseService {
//   static BuildContext? context;
//   static FirebaseMessaging? _firebaseMessaging;
//   static late AndroidNotificationChannel channel;
//   static FirebaseMessaging get firebaseMessaging =>
//       FirebaseService._firebaseMessaging ?? FirebaseMessaging.instance;

//   static Future<void> initializeFirebase() async {
//     await Firebase.initializeApp();
//     FirebaseService._firebaseMessaging = FirebaseMessaging.instance;
//     await FirebaseService.onMessage();

//     const AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//     );
//     await FirebaseService.localNotificationsPlugin.initialize(
//         initializationSettings,
//         onSelectNotification: FirebaseService().onTapNotification);
//     await FirebaseService.onBackgroundMsg();
//     String? token = await FirebaseService().getDeviceToken();
//     LogService.debugPrintLog(tag: 'Token: ', message: token!);
//   }

//   void onTapNotification(String? response) async {
//     if (response != null) {
//       try {
//         String jsonString = response
//             .replaceAllMapped(
//                 RegExp(r'(\b\w+\b):'), (match) => '"${match.group(1)}":')
//             .replaceAllMapped(
//                 RegExp(r':\s*([\w/]+)'), (match) => ': "${match.group(1)}"');

//         Map<String, dynamic> jsonMap = jsonDecode(jsonString);
//         FirebaseNotificationModel firebaseNotificationModel =
//             FirebaseNotificationModel.fromJson(jsonMap);
//         if (firebaseNotificationModel.pageRoute != null) {
//           switch (firebaseNotificationModel.pageRoute) {
//             case SelectBrand.routeName:
//               NavigatorService.navigateTo(page: SelectBrand.routeName);
//               break;
//             case SavedAddress.routeName:
//               NavigatorService.navigateTo(page: SavedAddress.routeName);
//               break;
//           }
//         }
//       } catch (e) {
//         LogService.debugPrintLog(
//             tag: 'onTapNotification', message: 'On Tap Notification Failed');
//       }
//     }
//   }

//   Future<String?> getDeviceToken() async =>
//       await FirebaseMessaging.instance.getToken();

//   static final FlutterLocalNotificationsPlugin localNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static NotificationDetails platformChannelSpecifics =
//       const NotificationDetails(
//     android: AndroidNotificationDetails(
//       "high_importance_channel",
//       "High Importance Notifications",
//       priority: Priority.max,
//       importance: Importance.max,
//     ),
//   );

//   // for receiving message when app is in background or foreground
//   static Future<void> onMessage() async {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       if (Platform.isAndroid) {
//         // if this is available when Platform.isIOS, you'll receive the notification twice
//         await FirebaseService.localNotificationsPlugin.show(
//           0,
//           message.notification!.title,
//           message.notification!.body,
//           FirebaseService.platformChannelSpecifics,
//           payload: message.data.toString(),
//         );
//       }
//       if (!kIsWeb) {
//         channel = const AndroidNotificationChannel(
//           'high_importance_channel', // id
//           'High Importance Notifications', // title
//           importance: Importance.high,
//         );
//       }

//       await FirebaseService.localNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);

//       /// need this for ios foregournd notification
//       await FirebaseService.firebaseMessaging
//           .setForegroundNotificationPresentationOptions(
//         alert: true, // Required to display a heads up notification
//         badge: true,
//         sound: true,
//       );
//     });
//   }

//   static void setContext(BuildContext context) =>
//       FirebaseService.context = context;

//   static Future<void> onBackgroundMsg() async {
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   }
// }
