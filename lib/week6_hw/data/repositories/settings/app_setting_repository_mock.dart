import '../../../model/settings/app_settings.dart';
import 'app_setting_repository.dart';

class AppSettingsRepositoryMock extends AppSettingsRepository {
  @override
  Future<AppSettings> load() async {
    return AppSettings(themeColor: ThemeColor.blue);
  }

  @override
  Future<void> save(AppSettings settings) async {
  }
}
