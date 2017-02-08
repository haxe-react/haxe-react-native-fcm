package react.native.fcm;

import js.Promise;

@:jsRequire('react-native-fcm')
extern class FCM {
	public static function getFCMToken():Promise<String>;
	public static function restartFCM():Promise<String>;
	public static function requestPermissions():Void;
	public static function on<T>(label:String, listener:T->Void):Promise<T>;
	public static function subscribeToTopic(topic:String):Void;
	public static function unsubscribeFromTopic(topic:String):Void;
	public static function presentLocalNotification(input:LocalNotificationInput):Void;
	public static function scheduleLocalNotification(input:ScheduledLocalNotificationInput):Void;
	public static function getScheduledLocalNotifications(topic:String):Promise<Dynamic>;
	public static function cancelLocalNotification(id:String):Void;
	public static function cancelAllLocalNotifications():Void;
	public static function setBadgeNumber():Void;
	public static function getBadgeNumber():Promise<Int>;
	public static function send(senderId:String, data:Dynamic):Void;
}

typedef LocalNotificationInput = {
	?id:String,                               // (optional for instant notification)
	?title:String,                     // as FCM payload
	?body:String,                    // as FCM payload (required)
	?sound:String,                                   // as FCM payload
	?priority:String,                                   // as FCM payload
	?click_action:String,                             // as FCM payload
	?badge:Int,                                          // as FCM payload IOS only, set 0 to clear badges
	?number:Int,                                         // Android only
	?ticker:String,                   // Android only
	?auto_cancel:Bool,                                  // Android only (default true)
	?large_icon:String,                           // Android only
	?icon:String,                            // as FCM payload
	?big_text:String,     // Android only
	?sub_text:String,                     // Android only
	?color:String,                                       // Android only
	?vibrate:Int,                                       // Android only default: 300, no vibration if you pass null
	?tag:String,                                    // Android only
	?group:String,                                     // Android only
	?my_custom_data:String,             // extra data you want to throw
	?lights:Bool,                                       // Android only, LED blinking (default false)
	?show_in_foreground:Bool,                                  // notification when app is in foreground (local & remote)
}

typedef Notif = {
	?notification:Dynamic,
	?data:Dynamic,
}

typedef ScheduledLocalNotificationInput = {
	?fire_date:Date,
	?id:String,
	?body:String,
	?repeat_interval:RepeatIntervalType,
}

@:enum
abstract RepeatIntervalType(String) {
	var Week = 'week';
	var Day = 'day';
	var Hour = 'hour';
}