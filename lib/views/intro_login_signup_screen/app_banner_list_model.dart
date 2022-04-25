import 'package:essays/values/app_assets.dart';

class AppBanner {
  final int? id;
  final String? title;
  final String? content;
  final String? thumbnaiUrl;
  AppBanner(this.id, this.title, this.content, this.thumbnaiUrl);
}

List<AppBanner> appBannerList = [
  AppBanner(1, 'Joyfulness', 'Enjoy Happy moments with family',
      AppAssets.introImage1),
  AppBanner(
      2,
      'Convenience',
      'All your favorite in one place with online reservation feature',
      AppAssets.introImage2),
  AppBanner(
      3,
      'Enjoy & Reviews',
      'Enjoy all your great food, review and share your experience',
      AppAssets.introImage3),
];
