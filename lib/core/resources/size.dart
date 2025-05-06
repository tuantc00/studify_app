class AppSize {
  static late double screenWidth;
  static late double screenHeight;
  static late double appBarHeight;

  /// a common breakpoint for a typical 7-inch tablet
  static late double shortestSide;

  static double get screenHeightWithoutAppBar => screenHeight - appBarHeight;

  static void setSize(
    double screenWidth,
    double screenHeight,
    double appBarHeight, {
    required double shortestSide,
  }) {
    AppSize.screenWidth = screenWidth;
    AppSize.screenHeight = screenHeight;
    AppSize.appBarHeight = appBarHeight;
    AppSize.shortestSide = shortestSide;
  }

  final double designWidth;

  late double _scale;

  AppSize({
    required this.designWidth,
    double? frameWidth,
    double? frameHeight,
  }) {
    _scale = (frameWidth ?? screenWidth) / designWidth;
  }

  double scaleFrom(double size) => size * _scale;
}

bool get useMobileLayout => AppSize.shortestSide < 600;
