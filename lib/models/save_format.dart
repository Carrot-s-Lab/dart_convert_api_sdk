enum SaveFormat {
  /// Windows Text
  wintext('wintext'),

  /// Windows Text with line breaks preserved
  wintextlb('wintextlb'),

  /// DOS text
  dostext('dostext'),

  /// DOS text with line breaks preserved
  dostextlb('dostextlb'),

  /// Unicode text format
  unicodetext('unicodetext');

  final String value;

  const SaveFormat(this.value);
}
