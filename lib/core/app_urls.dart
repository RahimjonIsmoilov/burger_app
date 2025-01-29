class AppUrls {
  //! Auth
  static String baseUrl = "http://5.182.26.17:8001";
  static String login = "$baseUrl/token";
  static String register = "$baseUrl/users/create_user";

  //! Products

  static String getProducts(int page) =>
      "$baseUrl/product/get?page=$page&page_size=100";
}
