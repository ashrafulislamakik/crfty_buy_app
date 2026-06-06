class Urls {
  static const String _baseurls = "https://ecom-rs8e.onrender.com/api";
  static const String signup = "$_baseurls/auth/signup";
  static const String verifyotpurl = "$_baseurls/auth/verify-otp";
  static const String loginurl = "$_baseurls/auth/login";
  static const String homeSliderUrl = "$_baseurls/slides";
  static String CategoriesListUrl(int pageNo, int pageSize) =>
      "$_baseurls/categories?count=$pageSize&page=$pageNo";
}
