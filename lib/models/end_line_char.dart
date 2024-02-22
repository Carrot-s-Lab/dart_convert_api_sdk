enum EndLineChar {
  /// CR+LF (Windows)
  crlf('crlf'),

  /// CR (Windows)
  cr('cr'),

  /// LFCR (Mac OS)
  lfcr('lfcr'),

  /// LF (Mac OS)
  lf('lf');

  final String value;

  const EndLineChar(this.value);
}
