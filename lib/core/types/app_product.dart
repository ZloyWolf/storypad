// ignore_for_file: constant_identifier_names

enum AppProduct {
  relax_sounds,
  templates;

  String get productIdentifier => name;
  String get packageIdentifier {
    switch (this) {
      case AppProduct.relax_sounds:
        return 'relax_sounds_lifetime';
      case AppProduct.templates:
        return 'templates_lifetime';
    }
  }
}
