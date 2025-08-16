// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitleKids => '儿童应用';

  @override
  String get appTitleTutor => '教师应用';

  @override
  String welcomeUser(Object username) {
    return '欢迎 $username';
  }

  @override
  String get splashLoading => '加载中...';

  @override
  String get onboardingTitle => '欢迎';

  @override
  String get onboardingSubtitle => '让我们开始吧';

  @override
  String get loginWithGoogle => '使用 Google 继续';

  @override
  String get loginWithApple => '使用 Apple 继续';

  @override
  String get tabHome => '首页';

  @override
  String get tabMore => '更多';

  @override
  String get soroban => '算盘';

  @override
  String get comingSoon => '即将推出';

  @override
  String get profile => '个人资料';

  @override
  String get theme => '主题';

  @override
  String get signOut => '退出登录';
}
