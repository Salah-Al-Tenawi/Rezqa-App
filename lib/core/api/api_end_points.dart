class ApiEndPoint {
  static String basrurl = "https://freelancer-l1w8.onrender.com/api/";
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
  // company
  static String getallinustry = "category/industry/search";
  static String savecompany = "company/store";
  static String storageimage = "storage/image/store";
  static String company = "company";
  // client
  static String client = "client";
  static String saveclient = "client/store";

  // freelancer
  static String freelnacer = "api/freelancer";
  static String savefreelnacer = "api/freelancer/store";
}

class ApiKey {
  // Authorization
  static String authorization = "Authorization";
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

  static String data = "data";
  static String verified = "verified_at";
  static String profileImageID = "profile_image_id";
  static String backgroundImageID = "background_image_id";
  static String joproleId = "job_role_id";
  static String skillsId = "skill_ids";
  static String dataOfBirht = "date_of_birth";
  static String headline = "headline";

  static String gender = "gender";
  // conacted

  static String massage = "message";
}
