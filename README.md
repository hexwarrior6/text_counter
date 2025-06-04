English | [简体中文](README_zh-hans.md)
# text_counter

<p align="center">
    <a href="https://github.com/hexwarrior6/text_counter"><img alt="GitHub repo" src="https://img.shields.io/github/last-commit/hexwarrior6/text_counter?logo=github"></a>
    <a href="https://gitee.com/HexWarrior6/text_counter"><img alt="Gitee repo" src="https://img.shields.io/badge/Gitee-repo-red?logo=gitee"></a>
    <a href="https://pub.dev/packages/text_counter"><img alt="pub version" src="https://img.shields.io/pub/v/text_counter?logo=dart"></a>
    <a href="https://github.com/hexwarrior6/text_counter/blob/master/LICENSE"><img alt="LICENSE" src="https://img.shields.io/github/license/hexwarrior6/text_counter.svg?color=blue"></a>
</p>

A lightweight Dart utility for accurately counting characters and words in **over 100 languages**, including CJK (Chinese, Japanese, Korean), RTL (Right-to-Left) scripts like Arabic and Hebrew, and mixed-language texts.

`text_counter` uses **Microsoft Word-compatible word counting logic**, ensuring consistent and familiar results across different writing systems. This makes it ideal for applications requiring accurate text metrics — such as content editors, writing tools, and input validation systems.

## ✨ Features

- ✅ **Uses Microsoft Word's word counting rules**:  
  - Words are split by whitespace and common punctuation.
  - Hyphenated words (e.g., "state-of-the-art") are counted as a single word.
  - Numbers and symbols are treated appropriately based on context.
- ✅ **Language-aware counting strategies**:
  - **CJK (Character-based)**: Each character is counted individually (used for Chinese, Japanese, Korean, etc.).
  - **Latin & RTL scripts (Word-based)**: Standard word-based counting using appropriate delimiters and tokenization.
- 🔍 **Automatic language/script detection** for mixed-language texts.
- ⚡ **Lightweight and dependency-free**: No external libraries required.
- 🌐 **Supports over 100 languages** out of the box.

## 📦 Installation

Add this to your package's `pubspec.yaml`:

```yaml
dependencies:
  text_counter: ^0.1.2
```

Then run:

```bash
dart pub get
```

## 🧪 Usage

### Basic Example

```dart
import 'package:text_counter/text_counter.dart';

void main() {
  print('Chinese: ${TextCounter.count("你好，世界", languageCode: "zh")}'); // 5
  print('Japanese: ${TextCounter.count("こんにちは世界", languageCode: "ja")}'); // 7
  print('Korean: ${TextCounter.count("안녕하세요 세상", languageCode: "ko")}'); // 7
  print('Arabic: ${TextCounter.count("مرحبا بالعالم", languageCode: "ar")}'); // 2
  print('Hebrew: ${TextCounter.count("שלום עולם", languageCode: "he")}'); // 2
  print('English: ${TextCounter.count("Hello world", languageCode: "en")}'); // 2

  const mixed = "Hello 你好 مرحبا こんにちは";
  print('Mixed Text "$mixed": ${TextCounter.count(mixed)}'); // 9
}
```

## 🗺️ Supported Languages

| Script Type               | Language Codes                                                                                                                                                                                                     |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **CJK (Character-based)** | `zh`, `yue`, `ja`, `ko`, `th`, `hi`, `bn`, `ta`, `te`, `kn`,`ml`, `si`, `km`, `my`, `lo`, `tl`, `jw`, `su`, `bo`, `dz`                                                                                             |
| **RTL (Word-based)**      | `ml`, `si`, `km`, `my`, `lo`, `tl`, `jw`, `su`, `bo`, `dz`                                                                                                                                                         |
| **Latin (Word-based)**    | All other ISO 639-1 language codes not listed above, including: `en`, `de`, `es`, `fr`, `it`, `pt`, `nl`, `tr`, `pl`, `ca`, `sv`, `id`, `fi`, `vi`, `hi`, `uk`, `el`, `ms`, `cs`, `ro`, `da`, `hu`, `no`, `th` ... |

> If no `languageCode` is provided, the library automatically detects script types and applies appropriate counting rules.

## 🛠️ How It Works

- For **CJK languages**, each ideographic or logographic character is counted individually.
- For **Latin and RTL scripts**, standard word boundaries are detected using whitespace and punctuation patterns similar to those used by Microsoft Word.
- In **mixed-language texts**, the counter dynamically switches between counting methods depending on the script being used.

## 🧩 Use Cases

- Content management systems
- Rich-text editors
- Writing apps with word limits
- Language learning platforms
- Analytics dashboards
- Form validation utilities

## 📚 API Reference

```dart
int TextCounter.count(String text, {String? languageCode})
```

- `text`: The input string to be analyzed.
- `languageCode`: Optional BCP 47 language code (e.g., `"en"` for English, `"zh"` for Chinese). If omitted, auto-detection is used.

## 📎 License

MIT License – see [LICENSE](LICENSE)
