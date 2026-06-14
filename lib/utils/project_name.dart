String normalizeProjectName(String name) => name.trim().toLowerCase();

String displayProjectName(String name) {
  final trimmed = name.trim();
  return trimmed.isEmpty ? 'Untitled project' : trimmed;
}
