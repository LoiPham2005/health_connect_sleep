import 'package:health/health.dart';
import 'dart:io' show Platform;

class HealthHelper {
  static Future<bool> isHealthConnectAvailable() async {
    if (!Platform.isAndroid) {
      return false; // Health Connect is only for Android
    }

    try {
      final health = Health();
      
      // Try to configure - if it fails, Health Connect likely not installed
      await health.configure();
      
      // Try a simple permission check to verify Health Connect is accessible
      final types = [HealthDataType.STEPS];
      await health.hasPermissions(types);
      
      return true;
    } catch (e) {
      // If any error occurs, assume Health Connect is not available
      return false;
    }
  }
  
  static String getHealthConnectPlayStoreUrl() {
    return 'https://play.google.com/store/apps/details?id=com.google.android.apps.healthdata';
  }
}