import 'package:text_counter/text_counter.dart';

void main() {
  print('Chinese: ${TextCounter.count("你好，世界", languageCode: "zh")}'); // 5
  print('Japanese: ${TextCounter.count("こんにちは世界", languageCode: "ja")}'); // 7
  print('Korean: ${TextCounter.count("안녕하세요 세상", languageCode: "ko")}'); // 7
  print(
      'Arabic: ${TextCounter.count("مرحبا بالعالم", languageCode: "ar")}'); // 2
  print('Hebrew: ${TextCounter.count("שלום עולם", languageCode: "he")}'); // 2
  print(
      'English: ${TextCounter.count("Hello world", languageCode: "en")}'); // 2

  const mixed = "Hello 你好 مرحبا こんにちは";
  print('Mixed Text "$mixed": ${TextCounter.count(mixed)}'); // 9
}
