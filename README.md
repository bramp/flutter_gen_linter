A set of simple linter rules to encourage the use of flutter_gen.

## Features

While using [flutter_gen](https://pub.dev/packages/flutter_gen) I wanted to ensure it was used consistently thoughout the project, so this is a set of [custom_lint](https://pub.dev/packages/custom_lint) rules to ensure that.

## Getting started

In your `pubspec.yaml` add:

```
dev_dependencies:
  custom_lint: ^0.5.0
  flutter_gen_linter: ^1.0.0
```

and create a `analysis_options.yaml` and add:

```
analyzer:
  plugins:
    - custom_lint
```

Now your IDE should show the lint warnings, like so:

![Screenshot of VS Code showing a lint warning](https://raw.githubusercontent.com/bramp/flutter_gen_linter/main/screenshot.png)

or you can manually run them from the command line:

```shell
$ dart run custom_lint

lib/your_file.dart:61:18 • AssetImage or Image.asset should not be used directly instead use Assets.images... • asset_image • INFO
```
