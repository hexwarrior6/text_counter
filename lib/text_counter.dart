/// Count the number of characters or words in the specified language text
class TextCounter {
  // Languages that are counted by characters (e.g., Chinese, Japanese, Korean, Thai)
  static final Set<String> _characterBasedLanguages = {
    'zh', 'yue', 'ja', 'ko', 'th', 'hi', 'bn', 'ta', 'te', 'kn',
    'ml', 'si', 'km', 'my', 'lo', 'tl', 'jw', 'su', 'bo', 'dz'
  };

  // RTL languages requiring special tokenization (Arabic/Hebrew family)
  static final Set<String> _rtlLanguages = {
    'ar', 'he', 'fa', 'ur', 'ps', 'ug', 'sd'
  };

  /// Main counting method
  static int count(String text, {String? languageCode}) {
    if (text.trim().isEmpty) return 0;

    if (languageCode != null) {
      if (_characterBasedLanguages.contains(languageCode)) {
        return _countCharacters(text);
      } else if (_rtlLanguages.contains(languageCode)) {
        return _countRtlWords(text);
      }
      return _countWords(text);
    }
    return _countMixed(text);
  }

  /// Count the number of characters (Chinese/Japanese, etc.)
  static int _countCharacters(String text) {
    return text.replaceAll(RegExp(r'\s+'), '').length;
  }

  /// Count the number of words in common languages (based on spaces)
  static int _countWords(String text) {
    return text.trim().isEmpty ? 0 : text.trim().split(RegExp(r'\s+')).length;
  }

  /// Count the number of words in RTL languages (Arabic/Hebrew)
  static int _countRtlWords(String text) {
    // Remove all punctuation (keep Arabic and Hebrew characters)
    final cleaned = text.replaceAllMapped(
      RegExp(r'[^\u0600-\u06FF\u0590-\u05FF\s]'),
      (match) => ''
    );
    
    if (cleaned.trim().isEmpty) return 0;
    
    // Split by whitespace, Arabic tatdeel (ـ), and Hebrew maqaf (־)
    return cleaned.split(RegExp(r'[\s\u0640\u05BE]+'))
      .where((word) => word.isNotEmpty)
      .length;
  }

  /// Count mixed-language text (automatically identifies different parts)
  static int _countMixed(String text) {
    // Match CJK characters (Chinese, Japanese, Korean)
    final cjkChars = RegExp(
      r'[\u4e00-\u9fff\u3040-\u309f\u30a0-\u30ff\uac00-\ud7af]'
    ).allMatches(text).length;

    // Match RTL text (Arabic, Hebrew, etc.)
    final rtlText = text.replaceAllMapped(
      RegExp(r'[^\u0600-\u06FF\u0590-\u05FF\s]'),
      (match) => ''
    );
    final rtlWords = _countRtlWords(rtlText);

    // Process remaining text (mainly Latin-based)
    final remainingText = text
      .replaceAll(RegExp(r'[\u4e00-\u9fff\u3040-\u309f\u30a0-\u30ff\uac00-\ud7af]'), ' ')
      .replaceAll(RegExp(r'[\u0600-\u06FF\u0590-\u05FF]'), ' ');
    
    final otherWords = remainingText.trim().isEmpty
      ? 0
      : remainingText.trim().split(RegExp(r'\s+')).length;

    return cjkChars + rtlWords + otherWords;
  }
}