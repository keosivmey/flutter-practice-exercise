import 'package:flutter/widgets.dart';
import '../../data/repositories/settings/app_setting_repository.dart';
import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingsRepository repository;

  AppSettings? _appSettings;

  AppSettingsState(AppSettingsRepository mockRepository, {required this.repository}) {
    init();
  }

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await repository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.pink;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;

    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    await repository.save(_appSettings!);

    notifyListeners();
  }
}
