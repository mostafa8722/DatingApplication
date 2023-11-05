import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'appControler.dart';
import 'screens/action/actionBinding.dart';
import 'screens/action/blocks/blocksBinding.dart';
import 'screens/action/contacts/contatcsBinding.dart';
import 'screens/action/favorites/favoritesBinding.dart';
import 'screens/action/likedMe/likedMeBinding.dart';
import 'screens/action/likes/likesBinding.dart';
import 'screens/action/seenMyProfile/seenProfileBinding.dart';
import 'screens/authentication/signin/signinBinding.dart';
import 'screens/authentication/signin/signinView.dart';
import 'screens/authentication/signinSocial/signinSocialBinding.dart';
import 'screens/authentication/signinSocial/signinSocialView.dart';
import 'screens/authentication/signup/signupBinding.dart';
import 'screens/authentication/signup/signupView.dart';
import 'screens/conversation/call/callBinding.dart';
import 'screens/conversation/call/callView.dart';
import 'screens/conversation/chat/chatBinding.dart';
import 'screens/conversation/chat/chatView.dart';
import 'screens/conversation/conversationBinding.dart';
import 'screens/home/homeBinding.dart';
import 'screens/intro/introBinding.dart';
import 'screens/intro/introView.dart';
import 'screens/main/mainBinding.dart';
import 'screens/main/mainView.dart';
import 'screens/map/mapBinding.dart';
import 'screens/map/selected/selectedMapUserBinding.dart';
import 'screens/map/selected/selectedMapUserView.dart';
import 'screens/profile/package/packageBinding.dart';
import 'screens/profile/package/packageView.dart';
import 'screens/profile/profileBinding.dart';
import 'screens/profile/setting/about/aboutBinding.dart';
import 'screens/profile/setting/about/aboutView.dart';
import 'screens/profile/setting/dataStorage/dataStorageBinding.dart';
import 'screens/profile/setting/dataStorage/dataStorageView.dart';
import 'screens/profile/setting/discovery/discoveryBinding.dart';
import 'screens/profile/setting/discovery/discoveryView.dart';
import 'screens/profile/setting/feedback/feedbackBinding.dart';
import 'screens/profile/setting/feedback/feedbackView.dart';
import 'screens/profile/setting/language/languageBinding.dart';
import 'screens/profile/setting/language/languageView.dart';
import 'screens/profile/setting/notification/notificationBinding.dart';
import 'screens/profile/setting/notification/notificationView.dart';
import 'screens/profile/setting/personalInformation/email/emailBinding.dart';
import 'screens/profile/setting/personalInformation/email/emailView.dart';
import 'screens/profile/setting/personalInformation/personalInformationBinding.dart';
import 'screens/profile/setting/personalInformation/personalInformationView.dart';
import 'screens/profile/setting/personalInformation/phone/phoneBinding.dart';
import 'screens/profile/setting/personalInformation/phone/phoneView.dart';
import 'screens/profile/setting/privacyPermission/privacyPermissionBinding.dart';
import 'screens/profile/setting/privacyPermission/privacyPermissionView.dart';
import 'screens/profile/setting/security/securityBinding.dart';
import 'screens/profile/setting/security/securityView.dart';
import 'screens/profile/setting/settingBinding.dart';
import 'screens/profile/setting/settingView.dart';
import 'screens/profile/user/userBinding.dart';
import 'screens/profile/user/userView.dart';
import 'screens/splash/splashBinding.dart';
import 'screens/splash/splashView.dart';
import 'utils/route.dart';
import 'utils/theme/theme.dart';
import 'utils/translations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Future.delayed(const Duration(milliseconds: 500));
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  var containsEncryptionKey = await secureStorage.containsKey(key: 'encryptionKey');
  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: 'encryptionKey', value: base64UrlEncode(key));
  }

  Get.put(AppController(),permanent: true);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark));
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }

  runApp(
      Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            title: "appTitle".tr,
            darkTheme: darkTheme,
            theme: lightTheme,
            initialRoute: MyRoute.splashRoute,
            translations: MyTranslations(),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            localizationsDelegates: const [
              DefaultWidgetsLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            locale: const Locale("en", "US"),
            getPages: [
              GetPage(
                name: MyRoute.splashRoute,
                page: () => const SplashView(),
                binding: SplashBinding()
              ),
              GetPage(
                name: MyRoute.introRoute,
                page: () => IntroView(),
                binding: IntroBinding()
              ),
              GetPage(
                name: MyRoute.signinRoute,
                page: () => const SignInView(),//todo auth view
                bindings:[SignInBinding()] //todo auth bindings
              ),
              GetPage(
                  name: MyRoute.signinSocialRoute,
                  page: () => const SignInSocialView(),//todo auth view
                  binding:SignInSocialBinding() //todo auth bindings
              ),
              GetPage(
                  name: MyRoute.signupRoute,
                  page: () => const SignUpView(),//todo auth view
                  binding:SignUpBinding() //todo auth bindings
              ),
              GetPage(
                  name: MyRoute.mainRoute,
                  page: () => const MainView(),
                  bindings:[MainBinding(),HomeBinding(),MapBinding(),ActionBinding(),ConversationBinding(),ProfileBinding(),
                    LikesBinding(),FavoritesBinding(),ContactsBinding(),LikedMeBinding(),BlocksBinding(),SeenProfileBinding()
                  ]
              ),
              GetPage(
                  name: MyRoute.mapUserRoute,
                  page: () => const SelectedMapUserView(),
                  binding:SelectedMapUserBinding()
              ),
              GetPage(
                  name: MyRoute.settingPersonalPhone,
                  page: () => const PhoneView(),
                  binding:PhoneBinding()
              ),
              GetPage(
                  name: MyRoute.settingPersonalEmail,
                  page: () => const EmailView(),
                  binding:EmailBinding()
              ),
              GetPage(
                  name: MyRoute.callRoute,
                  page: () => const CallView(),
                  binding:CallBinding()
              ),
              GetPage(
                  name: MyRoute.userProfileRoute,
                  page: () => const UserView(),
                  binding:UserBinding()
              ),
              GetPage(
                  name: MyRoute.chatRoute,
                  page: () => const ChatView(),
                  binding:ChatBinding()
              ),
              GetPage(
                  name: MyRoute.settingRoute,
                  page: () => const SettingView(),
                  binding:SettingBinding()
              ),
              GetPage(
                  name: MyRoute.packagesRoute,
                  page: () => const PackageView(),
                  binding:PackageBinding()
              ),
              GetPage(
                  name: MyRoute.settingPersonal,
                  page: () => const PersonalInformationView(),
                  binding:PersonalInformationBinding()
              ),
              GetPage(
                  name: MyRoute.settingDiscover,
                  page: () => const DiscoveryView(),
                  binding:DiscoveryBinding()
              ),
              GetPage(
                  name: MyRoute.settingPrivacy,
                  page: () => const PrivacyPermissionView(),
                  binding:PrivacyPermissionBinding()
              ),
              GetPage(
                  name: MyRoute.settingNotification,
                  page: () => const NotificationView(),
                  binding:NotificationBinding()
              ),
              GetPage(
                  name: MyRoute.settingSecurity,
                  page: () => const SecurityView(),
                  binding:SecurityBinding()
              ),
              GetPage(
                  name: MyRoute.settingStorage,
                  page: () => const DataStorageView(),
                  binding:DataStorageBinding()
              ),
              GetPage(
                  name: MyRoute.settingFeedback,
                  page: () => const FeedbackView(),
                  binding:FeedbackBinding()
              ),
              GetPage(
                  name: MyRoute.settingLanguage,
                  page: () => const LanguageView(),
                  binding:LanguageBinding()
              ),
              GetPage(
                  name: MyRoute.settingAbout,
                  page: () => const AboutView(),
                  binding:AboutBinding()
              )
            ]
        );
      }));
}

