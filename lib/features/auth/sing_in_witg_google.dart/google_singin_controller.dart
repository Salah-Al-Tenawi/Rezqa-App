// import 'package:freelanc/core/route/app_routes.dart';
// import 'package:freelanc/core/route/routes.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class SinginGoogleController extends GetxController {
//   var googleAccount = Rx<GoogleSignInAccount?>(null);
//   var accessToken = ''.obs;

//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ]);

//   void login() async {
//     try {
//       googleAccount.value = await _googleSignIn.signIn();
//       if (googleAccount.value != null) {
//         final auth = await googleAccount.value!.authentication;
//         accessToken.value = auth.accessToken!;
//         print("Access Token: ${accessToken.value}");
//         // Navigate to the respective user page based on user type
//         Get.offAll(MyRoute.chosetypeuser);
//       }
//     } catch (e) {
//       Get.snackbar("خطأ", "فشل تسجبل الدحول");
//       print("Error logging in with Google: $e");
//     }
//   }

//   void logout() async {
//     googleAccount.value = await _googleSignIn.signOut();
//     accessToken.value = '';
//     Get.offAllNamed('/login');
//   }
// }
