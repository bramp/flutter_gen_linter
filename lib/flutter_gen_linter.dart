import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

// This is the entrypoint of our custom linter
PluginBase createPlugin() => _FlutterGenLinter();

/// A plugin class is used to list all the assists/lints defined by a plugin.
class _FlutterGenLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        AvoidAssetImage(),
      ];
}

class AvoidAssetImage extends DartLintRule {
  AvoidAssetImage() : super(code: _code);

  /// Metadata about the warning that will show-up in the IDE.
  /// This is used for `// ignore: code` and enabling/disabling the lint
  static const _code = LintCode(
    name: 'asset_image',
    problemMessage:
        'AssetImage or Image.asset should not be used directly instead use Assets.images...',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // TODO How does this work for fully qualified names?
    // TODO Can we alias names?
    // TODO add SvgPicture.asset, and

    // Find all instances of AssetImage
    context.registry.addInstanceCreationExpression((node) {
      if (node.constructorName.toString() == "AssetImage") {
        reporter.reportErrorForNode(code, node);
      }

      if (node.constructorName.toString() == "Image.asset") {
        reporter.reportErrorForNode(code, node);
      }
    });
  }
}
