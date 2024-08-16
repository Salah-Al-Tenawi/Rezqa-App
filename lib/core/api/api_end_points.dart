
class ApiEndPoint {
  static String basrurl = "http://192.168.84.45:8000/api/";

  // storage

  static String uploadFile = "storage/file/store";
  static String storageimage = "storage/image/store";
  // auth
  static String resendOtp = "otp/resend";
  static String register = "otp/register";
  static String emailverify = "otp/email/verify";
  static String fogetpassword = "otp/forgot-password";
  static String restpassword = "otp/reset-password";
  static String resendotp = "otp/resend";
  static String login = "login";
  static String logout = "logout";
  static String singingoogle = "provider/google/sign-in/redirect";
  static String whoIam = "request.me";

  // company
  static String getallinustry = "category/industry/search";
  static String savecompany = "company/store";

  static String company = "company";
  // client
  static String client = "client";
  static String saveclient = "client/store";

  // freelancer
  static String freelnacer = "freelancer";
  static String savefreelnacer = "freelancer/store";
// freelnacerPortfolio
  static String getPortfolio = "freelancer/portfolio";
  static String storePortfolio = "freelancer/portfolio/store";
  static String updatePortfolio = "freelancer/portfolio";
  static String deletePortfolio = "freelancer/portfolio";

  // search skilles
  static String getskilles = "category/skill/search";
  // search joprole
  static String getjoprloe = "category/job_role/search";
// chat
  static String conversations = "conversations";
  static String messages = "messages";
}

class ApiKey {
  // Authorization
  static String authorization = "Authorization";
  static String error = "error";

// storage
  static String file = "file";
  static String files = "files";
  static String extention = "extention";

  //register
  static String id = "id";
  static String user = "user";
  static String roleId = "role_id";

  static String role = "role";
  static String username = "username";
  static String firstname = "first_name";
  static String lastname = "last_name";
  static String email = "email";
  static String password = "password";
  static String configpassword = "password_confirmation";
  static String otpcode = "password_otp_code";
  static String emailotp = "email_otp_code";
  static String token = "access_token";

  // profiles
  static String size = "size";
  static String city = "city";
  static String description = "description";
  static String regione = "region";
  static String name = "name";
  static String industryname = "industry_name";
  static String streetaddress = "street_address";
  static String profileimageUrl = "profile_image_url";
  static String backgroundimageUrl = "background_image_url";
  static String galleryimagesIds = "gallery_images_ids";
  static String galleryimages = "gallery_images";
  static String jobRole = "job_role";

  static String data = "data";
  static String verified = "verified_at";
  static String profileImageID = "profile_image_id";
  static String backgroundImageID = "background_image_id";
  static String joproleId = "job_role_id";
  static String skillsId = "skill_ids";
  static String dataOfBirht = "date_of_birth";
  static String headline = "headline";

  static String gender = "gender";

  // freelancer protfolio
  static String portfolioId = "portfolio_id";
  static String title = "title";
  static String url = "url";
  static String date = "date";
  static String fileIds = "file_ids";
  static String imageIds = "image_ids";
  static String section = "section";
  static String portfolios = "portfolios";
  static String skills = "skills";
  static String createdAt = "created_at";
  static String updatedAt = "updated_at";

  static String likesCount = "likes_count";
  static String viewsCount = "  views_count";

// chat

  static String userId = "user_id";
  static String message = "message";
  static String conversationId = "conversation_id";
  static String participants = "participants";
  static String participant = "participant";
  static String lastMessage = "last_message";
  static String avatar = "avatar";

  static String online = "online";

  // conacted

  static String massage = "message";
  static String image = "image";
  static String images = "images";
}
