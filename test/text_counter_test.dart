import 'package:text_counter/text_counter.dart';
import 'package:test/test.dart';

void main() {
  group('TextCounter Tests', () {
    // --- 中文统计 ---
    test('Chinese (zh)', () {
      expect(TextCounter.count("你好世界", languageCode: "zh"), equals(4));
      expect(TextCounter.count("今天天气真好", languageCode: "zh"), equals(6));
      expect(TextCounter.count("你好, 世界！", languageCode: "zh"), equals(6));
    });

    // --- 日文统计 ---
    test('Japanese (ja)', () {
      expect(TextCounter.count("こんにちは世界", languageCode: "ja"), equals(7));
      expect(TextCounter.count("今日はいい天気ですね", languageCode: "ja"), equals(10));
      expect(TextCounter.count("ありがとう。", languageCode: "ja"), equals(6));
    });

    // --- 韩文统计 ---
    test('Korean (ko)', () {
      expect(TextCounter.count("안녕하세요 세상", languageCode: "ko"), equals(7));
      expect(TextCounter.count("오늘은 날씨가 좋네요", languageCode: "ko"), equals(9));
    });

    // --- 英文统计 ---
    test('English (en)', () {
      expect(TextCounter.count("Hello world", languageCode: "en"), equals(2));
      expect(
          TextCounter.count("This is a test.", languageCode: "en"), equals(4));
      expect(TextCounter.count("One   multiple     spaces", languageCode: "en"),
          equals(3));
    });

    // --- 阿拉伯语统计 ---
    test('Arabic (ar)', () {
      expect(TextCounter.count("مرحبا بالعالم", languageCode: "ar"), equals(2));
      expect(
          TextCounter.count("كيف حالك اليوم؟", languageCode: "ar"), equals(3));
      expect(TextCounter.count("السلام عليكم ورحمة الله", languageCode: "ar"),
          equals(4));
    });

    // --- 希伯来语统计 ---
    test('Hebrew (he)', () {
      expect(TextCounter.count("שלום עולם", languageCode: "he"), equals(2));
      expect(
          TextCounter.count("מה שלומך היום?", languageCode: "he"), equals(3));
      expect(TextCounter.count("תודה רבה לך", languageCode: "he"), equals(3));
    });

    // --- 自动识别混合文本 ---
    test('Mixed text detection', () {
      expect(TextCounter.count("Hello 你好 مرحبا こんにちは"),
          equals(9)); // 1 + 2 + 1 + 1
      expect(
          TextCounter.count("The quick brown fox jumps over the lazy dog. 你好吗"),
          equals(12));
      expect(TextCounter.count("مرحبا Hello كيف الحال？こんにちは"),
          equals(10)); // ar + en + ar + ja
    });

    // --- 边界测试 ---
    test('Edge cases', () {
      expect(TextCounter.count(""), equals(0)); // 空字符串
      expect(TextCounter.count("   "), equals(0)); // 全空格
      expect(TextCounter.count(".,!@#\$%^&*()"), equals(1)); // 只有标点
      expect(TextCounter.count(".,!@#\$% ^&*()"), equals(2)); // 标点加空格
      expect(TextCounter.count("   Hello   world   "), equals(2)); // 前后空格
      expect(TextCounter.count("你好,, 世界!!"), equals(6)); // 中文夹杂标点
      expect(TextCounter.count("שלום־עולם", languageCode: "he"),
          equals(2)); // 希伯来连接符
    });
  });
}
