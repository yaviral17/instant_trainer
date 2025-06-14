import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreAPIs {
  // instance of FirebaseFirestore
  final db = FirebaseFirestore.instance;

  final String users = 'users';
  final String userPreferences = 'user_preferences';
  final String usageStats = 'usage_stats';

  Future<void> addUsage(
    String userId,
    String name,
    String age,
    double height,
    double weight,
    Map<String, dynamic> deviceinfo,
    String gender,
  ) async {
    try {
      await db.collection(usageStats).doc(userId).set({
        'userId': userId,
        'name': name,
        'age': age,
        'height': height,
        'weight': weight,
        'gender': gender,
        'deviceinfo': deviceinfo,
        'createdAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      print('Error adding usage: $e');
    }
  }
}
