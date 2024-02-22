enum TextEncoding {
  /// Auto
  auto('auto'),

  /// ASCII
  ascii('ascii'),

  /// UTF-7 encoding
  utf7('utf-7'),

  /// UTF-8 encoding
  utf8('utf-8'),

  /// ISO-8859-1
  iso88591('iso-8859-1'),

  /// ISO-8859-2
  iso88592('iso-8859-2'),

  /// ISO-8859-6
  iso88596('iso-8859-6'),

  /// ISO-8859-15
  iso885915('iso-8859-15'),

  /// Windows-1252
  windows1252('windows-1252'),

  /// Arabic ASMO
  arabicasmo('arabicasmo'),

  /// Baltic
  baltic('baltic'),

  /// Central European
  centraleuropean('centraleuropean'),

  /// Cyrillic
  cyrillic('cyrillic'),

  /// Europa
  europa('europa'),

  /// Extended Alpha lowercase
  extalphalowercase('extalphalowercase'),

  /// Greek
  greek('greek'),

  /// Hebrew
  hebrew('hebrew'),

  /// Simplified Chinese (HZGB)
  hzgbsimplifiedchinese('hzgbsimplifiedchinese'),

  /// German
  german('german'),

  /// Japanese (Shift-JIS)
  japaneseshiftjis('japaneseshiftjis'),

  /// KOI8-R
  koi8R('koi8-r'),

  /// K0I8-U
  koi8U('koi8-u'),

  /// Korean
  korean('korean'),

  /// Thai
  thai('thai'),

  /// Turkish
  turkish('turkish'),

  /// Unicode big endian
  unicodebigendian('unicodebigendian'),

  /// Unicode little endian
  unicodelittleendian('unicodelittleendian'),

  /// Vietnamese
  vietnamese('vietnamese');

  final String value;

  const TextEncoding(this.value);
}
