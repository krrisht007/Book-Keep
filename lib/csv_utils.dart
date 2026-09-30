List<String> parseCsvLine(String line) {
  final fields = <String>[];
  final buffer = StringBuffer();
  bool inQuotes = false;
  for (int i = 0; i < line.length; i++) {
    final c = line[i];
    if (inQuotes) {
      if (c == '"' && i + 1 < line.length && line[i + 1] == '"') {
        buffer.write('"');
        i++;
      } else if (c == '"') {
        inQuotes = false;
      } else {
        buffer.write(c);
      }
    } else if (c == '"') {
      inQuotes = true;
    } else if (c == ',') {
      fields.add(buffer.toString().trim());
      buffer.clear();
    } else {
      buffer.write(c);
    }
  }
  fields.add(buffer.toString().trim());
  return fields;
}
