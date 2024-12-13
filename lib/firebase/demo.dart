import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

String? deviceToken;

class FirebaseDemo {
  final firebaseMessaging = FirebaseMessaging.instance;


  Future<void> initNotification() async {
    // await firebaseMessaging.requestPermission(
    //   alert: true,
    //   badge: true,
    //   sound: true,
    //   provisional: false,
    // );

    // Get FCM token
    final fcmToken = await firebaseMessaging.getToken();
    deviceToken = fcmToken ?? '';
    if (kDebugMode) {
      print("FCM Token: $deviceToken");
    }

    /*
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      AndroidNotification? android;
      RemoteNotification? notification;

      if (kDebugMode) {
        print("Got a message whilst in the open app!");
        print("Message data: ${message.data}");
      }

      // Assign the values after declaring
      notification = message.notification;
      android = message.notification?.android;
      String? imageUrl = message.data['imageUrl'];

      if (kDebugMode) {
        print("Notification Title: ${notification?.title}");
        print("Notification : ${notification.toString()}");
        print("Notification Body: ${notification?.body}");
        print("Image URL: $imageUrl");
      }

      if (notification != null && android != null) {
        // Download image if URL is provided
        ByteArrayAndroidBitmap? bigPicture;
        if (imageUrl != null && imageUrl.isNotEmpty) {
          try {
            final http.Response response = await http.get(Uri.parse(imageUrl));
            if (response.statusCode == 200) {
              bigPicture = ByteArrayAndroidBitmap(response.bodyBytes);
            }
          } catch (e) {
            if (kDebugMode) {
              print("Error downloading image: $e");
            }
          }
        }

        final BigPictureStyleInformation? bigPictureStyleInformation =
            bigPicture != null
                ? BigPictureStyleInformation(
                    bigPicture,
                    largeIcon: const DrawableResourceAndroidBitmap(
                        '@mipmap/ic_launcher'),
                    contentTitle: notification.title,
                    summaryText: notification.body,
                  )
                : null;

        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher',
              importance: Importance.max,
              priority: Priority.high,
              styleInformation: bigPictureStyleInformation,
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _initializeLocalNotifications();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print("ON message open app");
        print("OnMessageOpenedApp: $message");
      }
    });
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (kDebugMode) {
          print("Notification clicked: ${response.payload}");
        }
      },
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
  */
  }
}
