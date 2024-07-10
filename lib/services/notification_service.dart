import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';


class NotificationService {
  static String basicNotificationKey = "basic_notification";
  static String scheduled = "scheduled";


  static void init() async {
    var noti = AwesomeNotifications();
    noti.initialize(
        null,
        [
          NotificationChannel(
              channelKey: scheduled,
              channelName: "basic",
              channelDescription: "ba   sic notifications",
            importance: NotificationImportance.Max,
          ),
        ],
        debug: true
    );
    noti.isNotificationAllowed().then((value) {
      if (!value) {
        noti.requestPermissionToSendNotifications();
      }
    });
  }
  void createNotification({int id = 123, required String? title, required String content, TimeOfDay? scheduleTime}) async {
    // Check if scheduleTime is null, and provide a default value if it is
    title ??=" ";
    scheduleTime ??= TimeOfDay(hour: 0, minute: 0); // Set to midnight as default

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Convert the scheduleTime to DateTime by combining with the current date
    DateTime combinedDateTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      scheduleTime.hour,
      scheduleTime.minute,
    );

    // Calculate the delay until the scheduled time
    DateTime utcNow = DateTime.now().toUtc();
    DateTime utcScheduleTime = combinedDateTime.toUtc();
    Duration delay = utcScheduleTime.difference(utcNow);

// Ensure the interval is at least 6 seconds to satisfy the requirement
    int intervalInSeconds = delay.inSeconds;

    if (intervalInSeconds <= 5) {
      intervalInSeconds = 6; // Set interval to at least 6 seconds
    }

    // Create the notification with the calculated delay
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'scheduled', // Fixed: channelKey should be a string
        title: title,
        body: content,
        wakeUpScreen: true,
        category: NotificationCategory.Alarm,
      ),
      schedule: NotificationInterval(
        interval: intervalInSeconds, // Set interval to the calculated interval in seconds
        timeZone: utcScheduleTime.timeZoneName, // Set timeZone to the timeZoneName of the scheduleTime
        preciseAlarm: true,
      ),
    );
  }

}