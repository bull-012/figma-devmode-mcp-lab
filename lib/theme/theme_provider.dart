import 'package:flutter/material.dart';

/// Theme provider for managing app-wide theme state
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  
  ThemeMode get themeMode => _themeMode;
  
  void setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }
}

/// InheritedWidget for accessing ThemeProvider
class ThemeProviderWidget extends InheritedWidget {
  final ThemeProvider themeProvider;
  
  const ThemeProviderWidget({
    super.key,
    required this.themeProvider,
    required super.child,
  });
  
  static ThemeProvider of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<ThemeProviderWidget>();
    if (widget == null) {
      throw FlutterError('ThemeProviderWidget not found in context');
    }
    return widget.themeProvider;
  }
  
  @override
  bool updateShouldNotify(ThemeProviderWidget oldWidget) {
    return themeProvider != oldWidget.themeProvider;
  }
}

/// Extension for easy access to theme provider
extension ThemeProviderExtension on BuildContext {
  ThemeProvider get themeProvider => ThemeProviderWidget.of(this);
  
  ThemeMode get themeMode => themeProvider.themeMode;
}