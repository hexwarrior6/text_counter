[English](README.md) | 简体中文
# text_counter

<p align="center">
    <a href="https://github.com/hexwarrior6/text_counter"><img alt="GitHub 仓库" src="https://img.shields.io/github/last-commit/hexwarrior6/text_counter?logo=github"></a>
    <a href="https://gitee.com/HexWarrior6/text_counter"><img alt="Gitee 仓库" src="https://img.shields.io/badge/Gitee-repo-red?logo=gitee"></a>
    <a href="https://pub.dev/packages/text_counter"><img alt="pub 版本" src="https://img.shields.io/pub/v/text_counter?logo=dart"></a>
    <a href="https://github.com/hexwarrior6/text_counter/blob/master/LICENSE"><img alt="许可证" src="https://img.shields.io/github/license/hexwarrior6/text_counter.svg?color=blue"></a>
</p>

一个轻量级的 Dart 工具库，用于精确统计**100多种语言**的字符数和词数，包括 CJK（中文、日文、韩文）、阿拉伯语和希伯来语等从右向左书写的文字（RTL），以及混合语言的文本。

`text_counter` 采用**与 Microsoft Word 兼容的词数统计逻辑**，确保在不同书写系统中都能获得一致且熟悉的统计结果。这使得它非常适合需要精确文本统计的应用场景，例如内容编辑器、写作工具和输入验证系统。

## ✨ 功能特点

- ✅ 采用 Microsoft Word 的词数统计规则：
  - 通过空格和常见标点符号分隔单词。
  - 连字符连接的单词（如 "state-of-the-art"）会被视为一个单词。
  - 根据上下文正确处理数字和符号。

- ✅ 支持语言感知的统计策略：
  - **CJK（基于字符）**：每个字符单独计数（适用于中文、日文、韩文等）。
  - **拉丁文字和 RTL 文字（基于单词）**：使用适当的分隔符和分词规则进行标准的单词计数。

- 🔍 **自动检测混合文本的语言/文字类型**。

- ⚡ **轻量级且无依赖**：无需外部库。

- 🌐 **开箱即用支持 100 多种语言**。

## 📦 安装

在项目的 `pubspec.yaml` 文件中添加：

```yaml
dependencies:
  text_counter: ^0.1.2
```

然后运行：

```bash
dart pub get
```

## 🧪 使用方法

### 基础示例

```dart
import 'package:text_counter/text_counter.dart';

void main() {
  print('中文: ${TextCounter.count("你好，世界", languageCode: "zh")}'); // 5
  print('日文: ${TextCounter.count("こんにちは世界", languageCode: "ja")}'); // 7
  print('韩文: ${TextCounter.count("안녕하세요 세상", languageCode: "ko")}'); // 7
  print('阿拉伯语: ${TextCounter.count("مرحبا بالعالم", languageCode: "ar")}'); // 2
  print('希伯来语: ${TextCounter.count("שלום עולם", languageCode: "he")}'); // 2
  print('英文: ${TextCounter.count("Hello world", languageCode: "en")}'); // 2

  const mixed = "Hello 你好 مرحبا こんにちは";
  print('混合文本 "$mixed": ${TextCounter.count(mixed)}'); // 9
}
```

## 🗺️ 支持的语言

| 文字类型           | 语言代码                                                                                                                                                                          |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **CJK（基于字符）**  | `zh`, `yue`, `ja`, `ko`, `th`, `hi`, `bn`, `ta`, `te`, `kn`,`ml`, `si`, `km`, `my`, `lo`, `tl`, `jw`, `su`, `bo`, `dz`                                                        |
| **RTL（基于单词）**  | `ml`, `si`, `km`, `my`, `lo`, `tl`, `jw`, `su`, `bo`, `dz`                                                                                                                    |
| **拉丁文字（基于单词）** | 所有其他未列出的 ISO 639-1 语言代码，包括：`en`, `de`, `es`, `fr`, `it`, `pt`, `nl`, `tr`, `pl`, `ca`, `sv`, `id`, `fi`, `vi`, `hi`, `uk`, `el`, `ms`, `cs`, `ro`, `da`, `hu`, `no`, `th` ... |

> 如果不提供 `languageCode`，库会自动检测文字类型并应用适当的统计规则。

## 🛠️ 工作原理

- 对于 **CJK 语言**，每个表意文字或语素文字字符都会被单独计数。
- 对于 **拉丁文字和 RTL 文字**，使用类似于 Microsoft Word 的空格和标点符号模式来检测单词边界。
- 在 **混合语言文本**中，计数器会根据所使用的文字类型动态切换统计方法。

## 🧩 适用场景

- 内容管理系统
- 富文本编辑器
- 有字数限制的写作应用
- 语言学习平台
- 分析仪表盘
- 表单验证工具

## 📚 API 参考

```dart
int TextCounter.count(String text, {String? languageCode})
```

- `text`：需要分析的输入字符串。
- `languageCode`：可选的 BCP 47 语言代码（例如，`"en"` 表示英语，`"zh"` 表示中文）。如果省略，则使用自动检测。

## 📎 许可证

MIT 许可证 - 详见 [LICENSE](https://yuanbao.tencent.com/chat/naQivTmsDa/LICENSE)