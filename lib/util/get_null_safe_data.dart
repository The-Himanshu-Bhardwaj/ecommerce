// STRING DATA
String getNullSafeString(String? data, String returnValue) {
  if (data == null || data.isEmpty) {
    return returnValue;
  }
  return data.trim();
}

// INT DATA
int getNullSafeInt(int? data, int returnValue) {
  if (data == null) return returnValue;
  return data.toInt();
}

// DOUBLE DATA
double getNullSafeDouble(dynamic data, double returnValue) {
  if (data == null) return returnValue;
  return data is int ? data.toDouble() : data;
}
