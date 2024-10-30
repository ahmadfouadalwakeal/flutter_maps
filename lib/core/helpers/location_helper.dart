import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position?> getCurrentLocation() async {
    // التحقق مما إذا كانت خدمات الموقع مفعلة
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      // إذا كانت خدمات الموقع غير مفعلة، تطلب من المستخدم تفعيلها
      return Future.error('خدمات الموقع غير مفعلة.');
    }

    // التحقق من حالة إذن الموقع
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // إذا تم رفض الإذن، طلبه من المستخدم
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // في حالة استمرار الرفض
        return Future.error('تم رفض إذن الموقع.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // إذا كان المستخدم قد حظر الأذونات نهائيًا
      return Future.error(
          'تم رفض الإذن نهائيًا. لا يمكن طلب إذن الموقع مرة أخرى.');
    }

    // إذا كانت كل الأمور على ما يرام، الحصول على الموقع الحالي
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
