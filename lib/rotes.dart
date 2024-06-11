import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/middlware/mymiddleware.dart';
import 'package:admin_app/view/screen/auth/add_admin_image.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/checkemail.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:admin_app/view/screen/auth/login.dart';
import 'package:admin_app/view/screen/auth/signup.dart';
import 'package:admin_app/view/screen/auth/success_signup.dart';
import 'package:admin_app/view/screen/auth/verifycodesignup.dart';
import 'package:admin_app/view/screen/categories/add.dart';
import 'package:admin_app/view/screen/categories/edit.dart';
import 'package:admin_app/view/screen/categories/view.dart';
import 'package:admin_app/view/screen/coupon/add.dart';
import 'package:admin_app/view/screen/coupon/view.dart';
import 'package:admin_app/view/screen/delivery/view.dart';
import 'package:admin_app/view/screen/homepage/home.dart';
import 'package:admin_app/view/screen/items/add.dart';
import 'package:admin_app/view/screen/items/view.dart';
import 'package:admin_app/view/screen/notifications/notifications.dart';
import 'package:admin_app/view/screen/orders/archieve_orders.dart';
import 'package:admin_app/view/screen/orders/details.dart';
import 'package:admin_app/view/screen/orders/order_screen.dart';
import 'package:admin_app/view/screen/language.dart';
import 'package:admin_app/view/screen/onboarding.dart';
import 'package:admin_app/view/screen/orders/pending_orders.dart';
import 'package:admin_app/view/screen/setting/setting_page.dart';
import 'package:get/get.dart';

import 'view/screen/items/edit.dart';

List<GetPage<dynamic>>? routes = [
  // Auth
  /*    GetPage(
    name: "/",
    page: () => const Cart(),
  ),  */

  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [
      MyMiddleWare(),
    ],
  ),
  GetPage(
    name: AppRotes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRotes.signUp,
    page: () => const SignUp(),
  ),
   GetPage(
    name: AppRotes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRotes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRotes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRotes.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRotes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRotes.verifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(
    name: AppRotes.addAdminImage,
    page: () => const AddAdminImage(),
  ),
  GetPage(
    name: AppRotes.onBoarding,
    page: () => const OnBoarding(),
  ),

  //home page

  GetPage(
    name: AppRotes.homePage,
    page: () => const HomePage(),
  ),

  // categories
  GetPage(
    name: AppRotes.addCategories,
    page: () => const AddCategories(),
  ),
  GetPage(
    name: AppRotes.viewcategories,
    page: () => const ViewCategories(),
  ),

  GetPage(
    name: AppRotes.editCategories,
    page: () => const EditCategories(),
  ),

  //items
  GetPage(
    name: AppRotes.addItems,
    page: () => const AddItems(),
  ),

  GetPage(
    name: AppRotes.viewItems,
    page: () => const ViewItems(),
  ),

  GetPage(
    name: AppRotes.editItems,
    page: () => const EditItems(),
  ),

  //orders
  GetPage(
    name: AppRotes.ordersHome,
    page: () => const OrdersHome(),
  ),

  GetPage(
    name: AppRotes.pendingOrders,
    page: () => const PendingOrders(),
  ),
  GetPage(
    name: AppRotes.ordersDetails,
    page: () => const OrdersDetails(),
  ),

  GetPage(
    name: AppRotes.ordersArchieved,
    page: () => const ArchievedOrders(),
  ),

  GetPage(
    name: AppRotes.notifications,
    page: () => const NotificationsPage(),
  ),
  GetPage(
    name: AppRotes.viewCoupons,
    page: () => const CouponPageView(),
  ),
  GetPage(
    name: AppRotes.addCoupons,
    page: () => const AddCoupon(),
  ),
  GetPage(
    name: AppRotes.settingPage,
    page: () => const SettingPage(),
  ),
  GetPage(
    name: AppRotes.deliveryPage,
    page: () => const ViewDeliveryMen(),
  ),
];
