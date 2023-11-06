enum PageNames {
  home,
  setting,
  userSelect,
  userDetail,
}

class AppRoute {
  static final pages = [
    for (var name in PageNames.values) name.name,
  ];

  final String pageName;

  AppRoute.home() : pageName = PageNames.home.name;
  AppRoute.setting() : pageName = PageNames.setting.name;
  AppRoute.userSelect() : pageName = PageNames.userSelect.name;
  AppRoute.userDetail() : pageName = PageNames.userDetail.name;
  AppRoute.unknown() : pageName = '';

  //Used to get the current path
  static bool isUnknown(String path) {
    return !pages.contains(path);
  }

  static AppRoute getInstance(String path) {
    if (isUnknown(path)) {
      return AppRoute.unknown();
    }

    return switch (PageNames.values.byName(path)) {
      PageNames.home => AppRoute.home(),
      PageNames.setting => AppRoute.setting(),
      PageNames.userSelect => AppRoute.userSelect(),
      PageNames.userDetail => AppRoute.userDetail(),
    };
  }
}
