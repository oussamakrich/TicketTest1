

class AppEndPoints{
  static const String baseUrl = "http://102.37.222.122/corail/ServAuthentification/auth";
  static const String login = "$baseUrl/loginUser";
  static const String register = "$baseUrl/inscrire";
  static const String otpActivation = "$baseUrl/activationCompte";
  static const String resetPassword = "$baseUrl/request-password-reset";
  static const String verifyResetPassword = "$baseUrl/verify-reset-code";
  static const String updatePassword = "$baseUrl/reset-password";
  static const String updateProfile = "$baseUrl/updateProfil/";
  static const String getProfileImg = "http://102.37.222.122/ServAuthentification/auth/getImage/130";
  static const String updateProfileImg = "$baseUrl/updateUserProfileImage/130";

}