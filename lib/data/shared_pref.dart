import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String _mobileNumbersKey = 'mobile_numbers';

  static Future<void> addMobileNumber(String mobileNumber) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Get existing mobile numbers
    List<String> mobileNumbers = prefs.getStringList(_mobileNumbersKey) ?? [];
    
    // Add mobile number if not already exists
    if (!mobileNumbers.contains(mobileNumber)) {
      mobileNumbers.add(mobileNumber);
      await prefs.setStringList(_mobileNumbersKey, mobileNumbers);
    }
  }

  // Additional methods like getting saved numbers can be added here
  static Future<List<String>> getSavedMobileNumbers() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_mobileNumbersKey) ?? [];
  }
}