import 'package:get/get.dart';

class MyTranslations extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':en_US,
    'de_DE':de_DE,
  };
}

const en_US = {
  'appTitle': 'Dating Application',
  'signin': 'SIGN IN',
  'signup': 'SIGN UP',
  'signinButton': 'Sign in',
  'signupButton': 'Sign up',
  'signinDescription': 'Login to Your Account',
  'signupDescription': 'Create Your Account',
  'forgotPassword': 'Forgot Password?',
  'username': 'Email',
  'password': 'Password',
  'confirmPassword': 'Confirm password',
  'identificationCode': 'Identification code',
  'dontHaveAccount': 'Don’t have an account?',
  'alreadyHaveAccount': 'Already have an account?',
  'signinGoogle': 'Sign in with google',
  'signinFacebook': 'Sign in with facebook',
  'signinApple': 'Sign in with apple',
  'next': 'Next',
  'intro1Text': 'It’s easy to find a soul mate nearby & around you',
  'intro2Text': 'You can share, chat, and video call with your match',
  'intro3Text': 'Don’t wait anymore, find your soul mate right now!',
  'signinWithPassword': 'Sign in with password',
  'letsYouIn': 'Let s you in',
  'or': 'or',
  'orContinueWith': 'or continue with',
  'rememberMe': 'Remember me',
  'home': 'Home',
  'maps': 'Maps',
  'actions': 'Actions',
  'chats': 'Chats',
  'profile': 'Profile',
  'submit': 'Submit',
  'packages': 'Packages',
};

const de_DE = {
  'appTitle': 'Dating Application',
};

class MyText{
  static String appTitle = "appTitle".tr;
  static String signin = "signin".tr;
  static String signup = "signup".tr;
  static String signinDescription = "signinDescription".tr;
  static String signupDescription = "signupDescription".tr;
  static String signinButton = "signinButton".tr;
  static String signupButton = "signupButton".tr;
  static String forgotPassword = "forgotPassword".tr;
  static String username = "username".tr;
  static String password = "password".tr;
  static String confirmPassword = "confirmPassword".tr;
  static String identificationCode = "identificationCode".tr;
  static String dontHaveAccount = "dontHaveAccount".tr;
  static String alreadyHaveAccount = "alreadyHaveAccount".tr;
  static String signinGoogle = "signinGoogle".tr;
  static String signinFacebook = "signinFacebook".tr;
  static String signinApple = "signinApple".tr;
  static String next = "next".tr;
  static String intro1Text = "intro1Text".tr;
  static String intro2Text = "intro2Text".tr;
  static String intro3Text = "intro3Text".tr;
  static String signinWithPassword = "signinWithPassword".tr;
  static String letsYouIn = "letsYouIn".tr;
  static String or = "or".tr;
  static String orContinueWith = "orContinueWith".tr;
  static var rememberMe = "rememberMe".obs;
  static var home = "home".obs;
  static var maps = "maps".obs;
  static var actions = "actions".obs;
  static var chats = "chats".obs;
  static var profiles = "profile".obs;
  static var submit = "submit".obs;
  static var packages = "packages".obs;

  static var setting = "setting".obs;
  static var helpCenter = "help center".obs;
  static var inviteFriends = "Invite Friends".obs;
  static var logout = "Log out".obs;
  static var personalInformation = "Personal Information".obs;
  static var discoverySetting = "Discovery Settings".obs;
  static var notification = "Notification".obs;
  static var security = "Security".obs;
  static var language = "Language".obs;
  static var faceid = "Face ID".obs;
  static var biometric = "Biometric ID".obs;
  static var googleAuthenticator = "Google Authenticator".obs;
  static var blockedList = "Blocked List".obs;
  static var changePin = "Change PIN".obs;
  static var changePassword = "Change Password".obs;
  static var male = "Male".obs;
  static var female = "Female".obs;
  static var email = "Email".obs;
  static var phoneNumber = "Phone Number".obs;
  static var firstName = "First Name".obs;
  static var lastName = "Last Name".obs;
  static var birthdate = "Birthdate".obs;
  static var location = "Location".obs;
  static var age = "Age".obs;
  static var distance = "Distance(in km)".obs;
  static var searchArea = "Expand Search Area".obs;
  static var showMe = "show Me".obs;
  static var womenOnly = "Women Only".obs;
  static var hideLastSeen = "Hide Last Seen".obs;


}