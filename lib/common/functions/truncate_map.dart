Map<String, dynamic> truncateMap(int length, Map<String, dynamic> originalMap) {
  List<MapEntry<String, dynamic>> entries = originalMap.entries.toList();

  if (length >= entries.length) {
    // If the requested length is greater than or equal to the original map size,
    // return a copy of the original map
    return Map<String, dynamic>.from(originalMap);
  } else {
    // If the requested length is less than the original map size,
    // create a new map with only the first 'length' entries
    return Map<String, dynamic>.fromEntries(entries.sublist(0, length));
  }
}
