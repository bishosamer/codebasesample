class FormHandler {
  static void addToMap(String key, data, Map map) {
    map[key] = data;
  }

  static void removeFromMap(String key, Map map) {
    map.remove(key);
  }
}
