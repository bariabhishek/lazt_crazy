import 'package:get/get.dart';
import 'package:projects/screens/add_ads/add_images.dart';
import 'package:projects/screens/add_ads/add_product.dart';
import 'package:projects/screens/add_ads/review_upload_post.dart';
import 'package:projects/screens/add_ads/select_ad_catergory.dart';
import 'package:projects/screens/add_ads/set_price_location.dart';
import 'package:projects/screens/auth/email_verification.dart';
import 'package:projects/screens/auth/forgot_password.dart';
import 'package:projects/screens/auth/sign_up_screen.dart';
import 'package:projects/screens/auth/selection_screen.dart';
import 'package:projects/screens/auth/login.dart';
import 'package:projects/screens/home/story_view.dart';
import 'package:projects/screens/mainPages/main_page.dart';
import 'package:projects/screens/profile/drawer_screens/my_activities.dart';
import 'package:projects/screens/profile/drawer_screens/my_ads.dart';
import 'package:projects/screens/profile/drawer_screens/saved/my_saved.dart';
import 'package:projects/screens/splashScreen/splash_screen.dart';

import '../screens/profile/edit_profile.dart';

class Routes{
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/selectionScreen', page: () => SelectionScreen()),
    GetPage(name: '/register', page: () => SignUpScreen()),
    GetPage(name: '/forgot_password', page: () => ForgotPasswordScreen()),
    GetPage(name: '/email_verification', page: () => EmailVerificationScreen()),
    GetPage(name: '/main_page', page: () => MainPage()),
    GetPage(name: '/story_view', page: () => StoryView()),
    GetPage(name: '/select_ad_category', page: () => SelectAdCategory()),
    GetPage(name: '/add_product', page: () => AddProduct()),
    GetPage(name: '/add_images', page: () => AddImages()),
    GetPage(name: '/set_price_location', page: () => SetPriceLocation()),
    GetPage(name: '/review_n_upload', page: () => ReviewNUpload()),
    GetPage(name: '/edit_profile', page: () => EditProfile()),
    GetPage(name: '/my_ads', page: () => MyAdsScreen()),
    GetPage(name: '/my_activity', page: () => MyActivitiesScreen()),
    GetPage(name: '/saved_screen', page: () => SavedScreen()),
  ];
}